package com.cci.oms.login.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cci.core.generic.GenericDao;
import com.cci.core.generic.GenericServiceImpl;
import com.cci.core.generic.criteria.Criteria;
import com.cci.core.generic.tree.AdditionalParameters;
import com.cci.core.generic.tree.Item;
import com.cci.oms.login.container.Department;
import com.cci.oms.login.container.Menu;
import com.cci.oms.login.container.MenuExample;
import com.cci.oms.login.container.Permission;
import com.cci.oms.login.container.User;
import com.cci.oms.login.repository.MenuMapper;
import com.cci.oms.login.repository.PermissionMapper;
import com.cci.oms.login.service.PermissionService;

/**
 * 权限Service实现类
 *
 * @author fcj
 * 
 */
@Service
public class PermissionServiceImpl extends GenericServiceImpl<Permission, String> implements PermissionService {

    @Resource
    private PermissionMapper permissionMapper;
	@Resource
	private MenuMapper menuMapper;


    @Override
    public GenericDao<Permission, String> getDao() {
        return permissionMapper;
    }

    @Override
    public List<Permission> selectPermissionsByRoleId(String roleId) {
        return permissionMapper.selectPermissionsByRoleId(roleId);
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
    /**
     * 查询list里面是否有子节点
     * @param id
     * @return
     */
    public List<Item>  getChildren(List<Menu> menu,String id) {	
    	List<Item> menus = new ArrayList<Item>();
        for(Menu m:menu){
        	if(id.equals(m.getParentId())){
        		Item i=new Item();
            	i.setId(m.getId());
            	i.setName("<i class=\"'+ace_icon+' fa fa-cog \"></i> "+m.getName());
            	i.setBakName(m.getName());
        		menus.add(i);
        	}	
        }
        return menus;
    }
    
    
    /**
     * 查询节点
     * @param topChildren
     * @param resultTrees
     * @return
     */
    public List<Item> getAllChildren(List<Menu> allMenu,List<Menu> topMenu,List<Item> items,List<Permission> perm){
    	for(int i=0;i<topMenu.size();i++){
    		Menu tree=topMenu.get(i);
    		Item item=items.get(i);
        	item.setId(tree.getId());
        	item.setBakName(tree.getName());
        	List<Menu> children=isChildren(allMenu,tree.getId());
        	AdditionalParameters aps = new AdditionalParameters();
        	//如果以前有的权限，给予选中状态

        	for(Permission p:perm){
        		if(p.getPermissionMenu().equals(tree.getId())){
        			aps.setItemSelected(true);
        		}
        	}
        	
            if(children.size()>0){
            	List<Item> itemChildren=getChildren(allMenu,tree.getId());
            	aps.setChildren(itemChildren);
            	item.setName("<i class=\"'+ace_icon+' fa  fa-cogs blue\"></i> "+tree.getName());
            	item.setType("folder");
            	item.setAdditionalParameters(aps);
                tree.setChildren(children);
                getAllChildren(allMenu,children,itemChildren,perm);
            }else{
            	item.setType("item");
            	item.setAdditionalParameters(aps);
            }

        }
        return items;
    	
   }
	@Override
	public List<Item> getPermissionTreeByRoleId(String roleId) {
		
		
		MenuExample example=new MenuExample();
		Criteria c=example.createCriteria();
		//类型为菜单的数据
		c.andEqualTo("type", "menu");
	    //得到全部树形菜单
	    List<Menu> firstLevelPrivilege = menuMapper.selectByExampleAndList(new MenuExample());	
        //查出根部菜单
		List<Menu> topMenu = getAllPrivilegeList("ROOTC662ADC549B5B2CC6D9D8386B8B8");
		List<Item> item=getChildren(topMenu,"ROOTC662ADC549B5B2CC6D9D8386B8B8");
		//根据角色编号得到角色的权限
		List<Permission> permission =permissionMapper.selectPermissionsByRoleId(roleId);
		List<Item> m=getAllChildren(firstLevelPrivilege,topMenu,item,permission);
		return m;
	}
	

    /**
     * 查询子节点
     * @param id
     * @return
     */
    public List<Menu> getAllPrivilegeList(String id) {	
        MenuExample example =new MenuExample();
        Criteria c=example.createCriteria();
        c.andEqualTo("parent_id", id);
        List<Menu> firstLevelPrivilege = menuMapper.selectByExampleAndList(example);
        return firstLevelPrivilege;
    }
    


}
