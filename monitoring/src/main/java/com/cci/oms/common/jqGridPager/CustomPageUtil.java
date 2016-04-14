
package com.cci.oms.common.jqGridPager;

import java.util.*;

public class CustomPageUtil<T> 
{  
    /**
     *  根据list来做分页处理
     *  
     * @param request
     * @param count   总记录数
     * @param list   查询出来的总记录list
     * @return
     */
	public DataResponse<T> search(DataRequest request, int count ,List<T> list) 
	{ 
        DataResponse<T> response = new DataResponse<T>();  
        int limit = request.getRows() <= 0 ? 20 : request.getRows();//每页显示数量  
        int totalPages;//总页数  
        int page = request.getPage() <= 0 ? 1 : request.getPage();//当前显示页码  
          
        totalPages = count / limit;  
        if (count % limit != 0) {  
            totalPages++;  
        }  
        int currPage = Math.min(totalPages, page);  
          
        int start = currPage * limit - limit;  
        start = start < 0 ? 0 : start;  
          
        response.setRecords(count);  
        response.setTotal(totalPages);  
        response.setPage(currPage);  
        response.setRows(list);  
          
        return response;  
    }
	
}  
