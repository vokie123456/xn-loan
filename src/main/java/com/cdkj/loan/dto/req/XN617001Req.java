package com.cdkj.loan.dto.req;

import java.util.List;

import com.cdkj.loan.domain.CreditAudit;

/**
 * 修改资质申请
 * @author: asus 
 * @since: 2016年12月24日 下午1:34:52 
 * @history:
 */
public class XN617001Req {
    // 编号
    private String code;

    // 地区
    private String area;

    // 业务员（必填）
    private String saleman;

    // 车行（必填）
    private String carStore;

    // 经办银行（必填）
    private String jbBank;

    // 贷款类型（必填）
    private String loanType;

    // 贷款金额（必填）
    private String loanAmount;

    // 贷款人关系列表（必填）
    private List<CreditAudit> creditPeopleList;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getJbBank() {
        return jbBank;
    }

    public void setJbBank(String jbBank) {
        this.jbBank = jbBank;
    }

    public String getLoanType() {
        return loanType;
    }

    public void setLoanType(String loanType) {
        this.loanType = loanType;
    }

    public String getLoanAmount() {
        return loanAmount;
    }

    public void setLoanAmount(String loanAmount) {
        this.loanAmount = loanAmount;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getCarStore() {
        return carStore;
    }

    public void setCarStore(String carStore) {
        this.carStore = carStore;
    }

    public List<CreditAudit> getCreditPeopleList() {
        return creditPeopleList;
    }

    public void setCreditPeopleList(List<CreditAudit> creditPeopleList) {
        this.creditPeopleList = creditPeopleList;
    }

    public String getSaleman() {
        return saleman;
    }

    public void setSaleman(String saleman) {
        this.saleman = saleman;
    }

}
