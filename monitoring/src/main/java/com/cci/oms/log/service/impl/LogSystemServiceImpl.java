package com.cci.oms.log.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cci.core.generic.GenericDao;
import com.cci.core.generic.GenericServiceImpl;
import com.cci.oms.log.container.LogSystem;
import com.cci.oms.log.repository.LogSystemMapper;
import com.cci.oms.log.service.LogSystemService;

@Service
public class LogSystemServiceImpl extends GenericServiceImpl<LogSystem, LogSystem> implements LogSystemService {

    @Resource
    private LogSystemMapper logSystemMapper;

    @Override
    public int insert(LogSystem model) {
        return logSystemMapper.insert(model);
    }

    @Override
    public GenericDao<LogSystem, LogSystem> getDao() {
        return logSystemMapper;
    }

	@Override
	public List<LogSystem> doGetAllLog(LogSystem logSystem) {
		return logSystemMapper.selectByExampleAndPage(logSystem);
	}

}
