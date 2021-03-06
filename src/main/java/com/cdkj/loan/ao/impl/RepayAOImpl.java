package com.cdkj.loan.ao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cdkj.loan.ao.IRepayAO;
import com.cdkj.loan.bo.ICarBO;
import com.cdkj.loan.bo.ICreditOrderBO;
import com.cdkj.loan.bo.IRepayBO;
import com.cdkj.loan.bo.ISmsOutBO;
import com.cdkj.loan.bo.base.Page;
import com.cdkj.loan.bo.base.Paginable;
import com.cdkj.loan.common.DateUtil;
import com.cdkj.loan.core.CalculationUtil;
import com.cdkj.loan.domain.Car;
import com.cdkj.loan.domain.CreditOrder;
import com.cdkj.loan.domain.Repay;
import com.cdkj.loan.enums.ERepayStatus;
import com.cdkj.loan.exception.BizException;

//CHECK ��鲢��ע�� 
@Service
public class RepayAOImpl implements IRepayAO {

    @Autowired
    private IRepayBO repayBO;

    @Autowired
    private ISmsOutBO smsOutBO;

    @Autowired
    private ICarBO carBO;

    @Autowired
    private ICreditOrderBO creditOrderBO;

    @Override
    public String addRepay(Repay data) {
        Long count = 0L;
        data.setOverAmount(count);
        data.setShAmount(count);
        data.setSmsCount(0);
        return repayBO.saveRepay(data);
    }

    @Override
    public void editRepay(List<Repay> repayList) {
        Long amount = 0L;
        for (Repay repay : repayList) {
            Repay condition = new Repay();
            condition.setJbBank(repay.getJbBank());
            condition.setRealName(repay.getRealName());
            condition.setIdNo(repay.getIdNo());
            condition.setYhDatetime(repay.getShDatetime());
            List<Repay> list = repayBO.queryRepayList(condition);
            for (Repay repay2 : list) {
                repay2.setShAmount(repay.getShAmount());
                repay2.setShDatetime(repay.getShDatetime());
                repay2.setRemark(repay.getRemark());
                repay2.setStatus(ERepayStatus.YLL.getCode());
                repay2.setOverAmount(amount);
                repay2.setSmsCount(0);
                repayBO.refreshRepay(repay2);
            }
        }
    }

    @Override
    public int dropRepay(String code) {
        if (!repayBO.isRepayExist(code)) {
            throw new BizException("xn0000", "记录编号不存在");
        }
        return repayBO.removeRepay(code);
    }

    @Override
    public Paginable<Repay> queryRepayPage(int start, int limit, Repay condition) {
        Repay repay = new Repay();
        repay.setStatusList(condition.getStatusList());
        List<Repay> repayList = repayBO.queryRepayList(repay);
        Date cxStartDatetime = null;
        Date cxEndDatetime = null;
        if (CollectionUtils.isNotEmpty(repayList)) {
            // if (repayList.size() != 0) {
            // for (Repay repay2 : repayList) {
            // if (ERepayStatus.YLL.getCode().equals(repay2.getStatus())) {
            cxStartDatetime = DateUtil.getFirstDay(DateUtil.dateToStr(repayList
                .get(0).getYhDatetime(), DateUtil.FRONT_DATE_FORMAT_STRING));

            cxEndDatetime = DateUtil.getLastDay(DateUtil.dateToStr(repayList
                .get(0).getYhDatetime(), DateUtil.FRONT_DATE_FORMAT_STRING));
            // }
            // }
        }
        condition.setCxStarttime(cxStartDatetime);
        condition.setCxEndtime(cxEndDatetime);
        Paginable<Repay> page = repayBO.getPaginable(start, limit, condition);
        return page;
    }

    @Override
    public List<Repay> queryRepayList(Repay condition) {
        return repayBO.queryRepayList(condition);
    }

    @Override
    public Repay getRepay(String code) {
        return repayBO.getRepay(code);
    }

    @Override
    @Transactional
    public void editSms(String code) {
        if (!repayBO.isRepayExist(code)) {
            throw new BizException("xn0000", "记录编号不存在");
        }
        // 先查出来sms的次数
        Repay data = getRepay(code);
        CreditOrder creditOrder = creditOrderBO.getCreditOrder(data
            .getCreditOrderCode());
        Car car = new Car();
        car.setCreditOrderCode(data.getCreditOrderCode());
        List<Car> carList = carBO.queryCarList(car);
        String content = "尊敬的" + creditOrder.getRealName() + "先生/女士："
                + "您好。您办理的" + carList.get(0).getBrand() + "贷款，" + "您本期编号为"
                + data.getCode() + "的月供已到期，剩余。"
                + CalculationUtil.divi(data.getOverAmount() / 1000)
                + "未还。若已还款可忽略此短信，谢谢！";
        smsOutBO.sendSmsOut(creditOrder.getMobile(), content, "802182");
        int time = data.getSmsCount();

        Repay repay = new Repay();
        repay.setCode(code);
        repay.setSmsCount(time + 1);
        repay.setStatus(ERepayStatus.YF.getCode());
        repayBO.refreshSms(repay);

    }

    @Override
    public void editSue(String code) {
        if (!repayBO.isRepayExist(code)) {
            throw new BizException("xn0000", "记录编号不存在");
        }
        Repay data = getRepay(code);
        if (ERepayStatus.YQ.getCode().equals(data.getStatus())
                || ERepayStatus.YF.getCode().equals(data.getStatus())) {
            Repay repay = new Repay();
            repay.setCode(code);
            repay.setStatus(ERepayStatus.QS.getCode());
            repayBO.refreshSue(repay);
        }
    }

    @Override
    public void editAdvance(String code, String status, String updater,
            String remark) {
        if (!repayBO.isRepayExist(code)) {
            throw new BizException("xn0000", "记录编号不存在");
        }
        Long amount = 0L;
        Repay data = getRepay(code);
        Repay condition = new Repay();
        condition.setCreditOrderCode(data.getCreditOrderCode());
        condition.setStatus(status);
        ArrayList<String> statusList = new ArrayList<String>();
        statusList.add(ERepayStatus.YQ.getCode());
        statusList.add(ERepayStatus.YF.getCode());
        statusList.add(ERepayStatus.QS.getCode());
        statusList.add(ERepayStatus.TQ.getCode());
        condition.setStatusList(statusList);
        List<Repay> repayList = repayBO.queryRepayList(condition);
        for (Repay repay : repayList) {
            repay.setStatus(ERepayStatus.YTQ.getCode());
            repay.setShDatetime(new Date());
            repay.setShAmount(repay.getYhAmount());
            repay.setOverAmount(amount);
            repay.setRemark(remark);
            repayBO.refreshAdvance(repay);
        }
    }

    // 逾期登记
    @Override
    public void editAlso() {
        Long overAmount = null;
        Long count = 0L;
        Repay condition = new Repay();
        condition.setStatus(ERepayStatus.YLL.getCode());
        List<Repay> repayList = repayBO.queryRepayList(condition);
        for (Repay repay : repayList) {
            if (ERepayStatus.YLL.getCode().equals(repay.getStatus())) {
                overAmount = repay.getYhAmount() - repay.getShAmount();
                if (overAmount > 0) {
                    repay.setOverAmount(overAmount);
                    repay.setStatus(ERepayStatus.YQ.getCode());
                    repay.setOverDays(Integer.toString(DateUtil.daysBetween(
                        repay.getYhDatetime(), new Date())));
                } else {
                    repay.setOverAmount(count);
                    repay.setStatus(ERepayStatus.ALREAD.getCode());
                    repay.setOverDays(Integer.toString(DateUtil.daysBetween(
                        repay.getYhDatetime(), new Date())));
                }
                repayBO.refreshAlso(repay);
            }

        }

    }

    @Override
    public void editAlready(String code) {
        if (!repayBO.isRepayExist(code)) {
            throw new BizException("xn0000", "记录编号不存在");
        }
        Repay data = getRepay(code);
        if (ERepayStatus.YQ.getCode().equals(data.getStatus())
                || ERepayStatus.YF.getCode().equals(data.getStatus())
                || ERepayStatus.QS.getCode().equals(data.getStatus())) {
            Repay repay = new Repay();
            repay.setCode(code);
            repay.setStatus(ERepayStatus.ALREAD.getCode());
            repayBO.refreshSue(repay);
        }
    }

    @Override
    public Paginable<Repay> queryPageRepayGroup(int start, int limit,
            Repay condition) {
        Paginable<Repay> page = null;
        List<Repay> list = repayBO.queryGroupList(condition);
        page = new Page<Repay>(start, limit, list.size());
        List<Repay> dataList = repayBO.queryGroupList(condition,
            page.getStart(), page.getPageSize());
        page.setList(dataList);
        return page;
    }

    @Override
    public Repay getGroupRepay(String code) {
        return repayBO.getGroupRepay(code);
    }
}
