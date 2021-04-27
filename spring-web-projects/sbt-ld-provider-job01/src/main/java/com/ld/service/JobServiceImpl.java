package com.ld.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ld.dao.JobMapper;
import com.ld.entity.Job;

@Service
public class JobServiceImpl implements JobService {

	@Autowired
	private JobMapper objectMapper;
	
	@Override
	public Job findObjectById(Long id) {
		Job record = objectMapper.selectById(id);
		return record;
	}

}
