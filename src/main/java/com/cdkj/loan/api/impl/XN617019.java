package com.cdkj.loan.api.impl;

import com.cdkj.loan.ao.ICreditAuditAO;
import com.cdkj.loan.api.AProcessor;
import com.cdkj.loan.common.JsonUtil;
import com.cdkj.loan.core.StringValidater;
import com.cdkj.loan.dto.req.XN617019Req;
import com.cdkj.loan.exception.BizException;
import com.cdkj.loan.exception.ParaException;
import com.cdkj.loan.spring.SpringContextHolder;

/**
 * 详情查询借贷关系人
 * @author: asus 
 * @since: 2016年12月24日 下午1:14:49 
 * @history:
 */
public class XN617019 extends AProcessor {
    private ICreditAuditAO creditAuditAO = SpringContextHolder
        .getBean(ICreditAuditAO.class);

    private XN617019Req req = null;

    @Override
    public Object doBusiness() throws BizException {
        return creditAuditAO.getCreditAudit(req.getCode());
    }

    @Override
    public void doCheck(String inputparams) throws ParaException {
        req = JsonUtil.json2Bean(inputparams, XN617019Req.class);
        StringValidater.validateBlank(req.getCode());
    }

}
