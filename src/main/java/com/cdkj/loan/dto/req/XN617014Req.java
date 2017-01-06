package com.cdkj.loan.dto.req;

/**
 * 收款回录
 * @author: asus 
 * @since: 2016年12月25日 下午2:47:54 
 * @history:
 */
public class XN617014Req {

    // 编号
    public String code;

    // 收款金额
    public String amount;

    // 收款回录
    public String pdf;

    // 更新人
    private String updater;

    // 备注
    private String remark;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getPdf() {
        return pdf;
    }

    public void setPdf(String pdf) {
        this.pdf = pdf;
    }

    public String getUpdater() {
        return updater;
    }

    public void setUpdater(String updater) {
        this.updater = updater;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

}
