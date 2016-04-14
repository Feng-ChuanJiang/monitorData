package com.cci.oms.login.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cci.core.generic.GenericDao;
import com.cci.core.generic.GenericServiceImpl;
import com.cci.core.generic.criteria.Criteria;
import com.cci.oms.login.container.Menu;
import com.cci.oms.login.container.MenuExample;
import com.cci.oms.login.repository.MenuMapper;
import com.cci.oms.login.service.MenuService;

/**
 * 模块菜单
 * 
 * @author fcj
 * 
 */
@Service
public class MenuServiceImpl extends GenericServiceImpl<Menu, Menu> implements
		MenuService {
	@Resource
	private MenuMapper menuMapper;

	@Override
	public int insert(Menu model) {
		return menuMapper.insert(model);
	}

	@Override
	public int update(Menu model) {
		return menuMapper.updateByPrimaryKey(model);
	}

	@Override
	public int delete(Menu id) {
		return menuMapper.deleteByPrimaryKey(id);
	}

	@Override
	public Menu selectById(Menu id) {
		return menuMapper.selectByPrimaryKey(id);
	}

	@Override
	public GenericDao<Menu, Menu> getDao() {
		return menuMapper;
	}

	@Override
	public List<Menu> selectByExampleAndList(MenuExample example) {
		return menuMapper.selectByExampleAndList(example);
	}

	@Override
	public int countByExample(MenuExample example) {
		return menuMapper.countByExample(example);
	}

	@Override
	/**
	 * 通过url判断用户选择的菜单
	 */
	public String[] setMenuByAdd(String url) {
		String urls = url.substring(url.indexOf("monitorData") + 12);
		if (urls != null && !urls.equals("")) {
			MenuExample example = new MenuExample();
			example.createCriteria().andEqualTo("href", urls);
			List<Menu> m = menuMapper.selectByExampleAndList(example);
			for(Menu menu:m){
				if (menu != null&&menu.getType().equals("menu")) {
					String parentId = menuMapper.getParentId(menu.getId());
					String[] menuOpen = parentId.substring(2).split(",");
					String[] menuState = new String[menuOpen.length];
					int j = 0;
					for (int i = menuOpen.length; i > 0; i--) {
						menuState[j] = menuOpen[i - 1];
						j++;
						
					}
					return menuState;
				}
			}
		}
		return null;
	}
    /**
     * 把topMenu里面的菜单通过allMenu里面查找子节点
     * @param topChildren
     * @param resultTrees
     * @return
     */
    public List<Menu> getAllChildren(List<Menu> allMenu,List<Menu> topMenu){
        for(Menu tree:topMenu){   	
        	List<Menu> children=isChildren(allMenu,tree.getId());
            if(children.size()>0){
                tree.setChildren(children);
                getAllChildren(allMenu,children);
            }

        }
        return topMenu;
    	
   }
    /**
     * 查询节点
     * @param id
     * @return
     */
    public List<Menu> getAllPrivilegeList(MenuExample example) {	
        List<Menu> firstLevelPrivilege = menuMapper.selectByExampleAndList(example);
        return firstLevelPrivilege;
    }
    
    /**
     * 查询list里面是否有子节点
     * @param id
     * @return
     */
    public List<Menu>  isChildren(List<Menu> menu,String id) {	
    	List<Menu> menus = new ArrayList<Menu>();
        for(Menu m:menu){
        	if(id.equals(m.getParentId())){
        		menus.add(m);
        	}	
        }
        return menus;
    }

}
