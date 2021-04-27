package com.ld.entity;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

@TableName("job")
public class Job implements Serializable{
  
	private static final long serialVersionUID = 1L;
	
	@TableId(type=IdType.AUTO)
	private Long id;

    private Long userId;

    private Long deptId;

    private String jobName;

    private String edu;

    private Integer lowSalary;

    private Integer topSalary;

    private String graduate;

    private String jobPeriod;

    private String project;

    private String jobDuty;

    private String jobRequire;

    private Long professionId;

    private Date created;

    private Date updated;

    private String createdUser;

    private String modifiedUser;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getDeptId() {
        return deptId;
    }

    public void setDeptId(Long deptId) {
        this.deptId = deptId;
    }

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    public String getEdu() {
        return edu;
    }

    public void setEdu(String edu) {
        this.edu = edu;
    }

    public Integer getLowSalary() {
        return lowSalary;
    }

    public void setLowSalary(Integer lowSalary) {
        this.lowSalary = lowSalary;
    }

    public Integer getTopSalary() {
        return topSalary;
    }

    public void setTopSalary(Integer topSalary) {
        this.topSalary = topSalary;
    }

    public String getGraduate() {
        return graduate;
    }

    public void setGraduate(String graduate) {
        this.graduate = graduate;
    }

    public String getJobPeriod() {
        return jobPeriod;
    }

    public void setJobPeriod(String jobPeriod) {
        this.jobPeriod = jobPeriod;
    }

    public String getProject() {
        return project;
    }

    public void setProject(String project) {
        this.project = project;
    }

    public String getJobDuty() {
        return jobDuty;
    }

    public void setJobDuty(String jobDuty) {
        this.jobDuty = jobDuty;
    }

    public String getJobRequire() {
        return jobRequire;
    }

    public void setJobRequire(String jobRequire) {
        this.jobRequire = jobRequire;
    }

    public Long getProfessionId() {
        return professionId;
    }

    public void setProfessionId(Long professionId) {
        this.professionId = professionId;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Date getUpdated() {
        return updated;
    }

    public void setUpdated(Date updated) {
        this.updated = updated;
    }

    public String getCreatedUser() {
        return createdUser;
    }

    public void setCreatedUser(String createdUser) {
        this.createdUser = createdUser;
    }

    public String getModifiedUser() {
        return modifiedUser;
    }

    public void setModifiedUser(String modifiedUser) {
        this.modifiedUser = modifiedUser;
    }

	@Override
	public String toString() {
		return "Job [id=" + id + ", userId=" + userId + ", deptId=" + deptId + ", jobName=" + jobName + ", edu=" + edu
				+ ", lowSalary=" + lowSalary + ", topSalary=" + topSalary + ", graduate=" + graduate + ", jobPeriod="
				+ jobPeriod + ", project=" + project + ", jobDuty=" + jobDuty + ", jobRequire=" + jobRequire
				+ ", professionId=" + professionId + ", created=" + created + ", updated=" + updated + ", createdUser="
				+ createdUser + ", modifiedUser=" + modifiedUser + "]";
	}
    
}