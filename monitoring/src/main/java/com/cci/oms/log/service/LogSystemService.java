package com.cci.oms.log.service;


import java.util.List;

import com.cci.core.generic.GenericService;
import com.cci.oms.log.container.LogSystem;

public interface LogSystemService extends GenericService<LogSystem, LogSystem>
{

	public List<LogSystem> doGetAllLog(LogSystem logSystem);
}
