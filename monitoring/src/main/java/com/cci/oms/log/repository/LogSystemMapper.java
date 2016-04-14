
package com.cci.oms.log.repository;

import java.util.List;

import com.cci.core.generic.GenericDao;
import com.cci.oms.log.container.LogSystem;

public interface LogSystemMapper extends GenericDao<LogSystem, LogSystem> 
{
  public int insert(LogSystem record);

  public List<LogSystem> selectByExampleAndPage(LogSystem record);
    
}
