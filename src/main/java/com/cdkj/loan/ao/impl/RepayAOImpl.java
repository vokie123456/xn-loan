package com.cdkj.loan.ao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cdkj.loan.ao.IRepayAO;
import com.cdkj.loan.bo.IRepayBO;
import com.cdkj.loan.bo.base.Paginable;
import com.cdkj.loan.domain.Repay;
import com.cdkj.loan.exception.BizException;



//CHECK ��鲢��ע�� 
@Service
public class RepayAOImpl implements IRepayAO {

	@Autowired
	private IRepayBO repayBO;

	@Override
	public String addRepay(Repay data) {
		return repayBO.saveRepay(data);
	}

	@Override
	public int editRepay(Repay data) {
		if (!repayBO.isRepayExist(data.getCode())) {
			throw new BizException("xn0000", "记录编号不存在");
		}
		return repayBO.refreshRepay(data);
	}

	@Override
	public int dropRepay(String code) {
		if (!repayBO.isRepayExist(code)) {
			throw new BizException("xn0000", "记录编号不存在");
		}
		return repayBO.removeRepay(code);
	}

	@Override
	public Paginable<Repay> queryRepayPage(int start, int limit,
			Repay condition) {
		return repayBO.getPaginable(start, limit, condition);
	}

	@Override
	public List<Repay> queryRepayList(Repay condition) {
		return repayBO.queryRepayList(condition);
	}

	@Override
	public Repay getRepay(String code) {
		return repayBO.getRepay(code);
	}
}