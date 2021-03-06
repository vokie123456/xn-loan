package com.cdkj.loan.api.impl;

import com.cdkj.loan.ao.ICreditAuditAO;
import com.cdkj.loan.api.AProcessor;
import com.cdkj.loan.common.JsonUtil;
import com.cdkj.loan.core.StringValidater;
import com.cdkj.loan.domain.CreditAudit;
import com.cdkj.loan.dto.req.XN617002Req;
import com.cdkj.loan.exception.BizException;
import com.cdkj.loan.exception.ParaException;
import com.cdkj.loan.spring.SpringContextHolder;

/**
 * 征信调查
 * @author: asus 
 * @since: 2016年12月24日 下午2:56:20 
 * @history:
 */
public class XN617002 extends AProcessor {
    private ICreditAuditAO creditAuditAO = SpringContextHolder
        .getBean(ICreditAuditAO.class);

    private XN617002Req req = null;

    @Override
    public Object doBusiness() throws BizException {
        CreditAudit condition = new CreditAudit();
        condition.setCreditOrderCode(req.getCode());
        condition.setCourtDescript(req.getCourtDescript());
        condition.setCourtResult(req.getCourtResult());
        condition.setCreditResult(req.getCreditResult());
        condition.setCreditDescript(req.getCreditDescript());
        condition.setUpdater(req.getUpdater());
        condition.setRemark(req.getRemark());
        creditAuditAO.editCreditAudit(condition);
        return new Boolean(true);
    }

    @Override
    public void doCheck(String inputparams) throws ParaException {
        req = JsonUtil.json2Bean(inputparams, XN617002Req.class);
        StringValidater.validateBlank(req.getCode(), req.getCourtDescript(),
            req.getCourtResult(), req.getCreditDescript(),
            req.getCreditResult());
    }

}
