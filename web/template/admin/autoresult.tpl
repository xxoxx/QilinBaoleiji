<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
<title>会话列表</title>
<meta name="generator" content="editplus">
<meta name="author" content="nuttycoder">
<link href="{{$template_root}}/all_purpose_style.css" rel="stylesheet" type="text/css" />
</head>

<body>
<style type="text/css">
a {
    color: #003499;
    text-decoration: none;
} 
a:hover {
    color: #000000;
    text-decoration: underline;
}
</style>
<td width="84%" align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0"><tr><td valign="middle" class="hui_bj"><div class="menu">
<ul>
{{if $smarty.session.ADMIN_LEVEL eq 10 or $smarty.session.ADMIN_LEVEL eq 101}}
<li class="me_b"><img src="{{$template_root}}/images/an11.jpg" align="absmiddle"/><a href="admin.php?controller=admin_index&action=main">系统密码</a><img src="{{$template_root}}/images/an33.jpg" align="absmiddle"/></li>
<li class="me_b"><img src="{{$template_root}}/images/an11.jpg" align="absmiddle"/><a href="admin.php?controller=admin_index&action=apppassword">应用密码</a><img src="{{$template_root}}/images/an33.jpg" align="absmiddle"/></li>
<li class="me_b"><img src="{{$template_root}}/images/an11.jpg" align="absmiddle"/><a href="admin.php?controller=admin_pro&action=passwordedit">修改密码</a><img src="{{$template_root}}/images/an33.jpg" align="absmiddle"/></li>
{{if $smarty.session.ADMIN_LEVEL eq 10}}
<li class="me_b"><img src="{{$template_root}}/images/an11.jpg" align="absmiddle"/><a href="admin.php?controller=admin_pro&action=password_cron">定时任务</a><img src="{{$template_root}}/images/an33.jpg" align="absmiddle"/></li>
<li class="me_b"><img src="{{$template_root}}/images/an11.jpg" align="absmiddle"/><a href="admin.php?controller=admin_backup&action=backup_setting_forpassword">自动备份</a><img src="{{$template_root}}/images/an33.jpg" align="absmiddle"/></li>
<li class="me_b"><img src="{{$template_root}}/images/an11.jpg" align="absmiddle"/><a href="admin.php?controller=admin_index&action=passdown">密码文件下载</a><img src="{{$template_root}}/images/an33.jpg" align="absmiddle"/></li>
<li class="me_b"><img src="{{$template_root}}/images/an11.jpg" align="absmiddle"/><a href="admin.php?controller=admin_pro&action=passwordcheck">密码校验</a><img src="{{$template_root}}/images/an33.jpg" align="absmiddle"/></li>
{{/if}}
{{else}}
    <li class="me_b"><img src="{{$template_root}}/images/an11.jpg" align="absmiddle"/><a href="admin.php?controller=admin_autorun&action=autobackup_list">备份管理</a><img src="{{$template_root}}/images/an33.jpg" align="absmiddle"/></li>
	<li class="me_b"><img src="{{$template_root}}/images/an11.jpg" align="absmiddle"/><a href="admin.php?controller=admin_autorun&action=detail_config">巡检检测</a><img src="{{$template_root}}/images/an33.jpg" align="absmiddle"/></li>
	<li class="me_a"><img src="{{$template_root}}/images/an1.jpg" align="absmiddle"/><a href="admin.php?controller=admin_autorun&action=autorun_result">检测结果</a><img src="{{$template_root}}/images/an3.jpg" align="absmiddle"/></li>
{{/if}}
</ul><span class="back_img"><A href="admin.php?controller=admin_autorun&action=autorun_result&back=1"><IMG src="{{$template_root}}/images/back1.png" 
      width="80" height="30" border="0"></A></span>
</div></td></tr>

	<table width="100%" border="0" cellspacing="0" cellpadding="0">  
  <tr><td><table bordercolor="white" cellspacing="0" cellpadding="5" border="0" width="100%" class="BBtable">
		<form name="f1" method=post action="admin.php?controller=admin_autorun&action=autobackup_delete&type={{$smarty.get.type}}">
			<tr>
				<th class="list_bg"  width="10%"><a href="admin.php?controller=admin_autorun&action=autorun_result&orderby1=scriptpath&orderby2={{$orderby2}}" >序号</a></th>
				<th class="list_bg"  width="10%"><a href="admin.php?controller=admin_autorun&action=autorun_result&orderby1=scriptpath&orderby2={{$orderby2}}" >设备IP</a></th>
				<th class="list_bg"  width="10%"><a href="admin.php?controller=admin_autorun&action=autorun_result&orderby1=desc&orderby2={{$orderby2}}" >主机名</a></th>
				<th class="list_bg"  width="10%"><a href="admin.php?controller=admin_autorun&action=autorun_result&orderby1=desc&orderby2={{$orderby2}}" >脚本名称</a></th>
				<th class="list_bg"  width="10%"><a href="admin.php?controller=admin_autorun&action=autorun_result&orderby1=desc&orderby2={{$orderby2}}" >脚本</a></th>
				<th class="list_bg"  width="10%"><a href="admin.php?controller=admin_autorun&action=autorun_result&orderby1=desc&orderby2={{$orderby2}}" >执行时间</a></th>
				<th class="list_bg"  width="10%"><a href="admin.php?controller=admin_autorun&action=autorun_result&orderby1=desc&orderby2={{$orderby2}}" >结果</a></th>
				<th class="list_bg"  width="15%">查看</th>
			</tr>
			{{section name=t loop=$alldev}}
			<tr {{if $smarty.section.t.index % 2 == 0}}bgcolor="f7f7f7"{{/if}}>
			<td>{{$smarty.section.t.index+1}}</td>
				<td>{{$alldev[t].device_ip}}</td>
				<td>{{$alldev[t].hostname}}</td>
				<td>{{$alldev[t].name}}</td>
				<td>{{$alldev[t].scriptpath}}</td>
				<td>{{$alldev[t].datetime}}</td>
				<td>{{if $alldev[t].result}}成功{{else}}失败{{/if}}</td>
				<td style="TEXT-ALIGN: left;"><img src='./template/admin/images/edit_ico.gif' width=16 height='16' hspace='5' border='0' align='absmiddle'><a href='admin.php?controller=admin_autorun&action=auto_result_file&id={{$alldev[t].id}}' target='_blank'>查看</a> | <img src='./template/admin/images/edit_ico.gif' width=16 height='16' hspace='5' border='0' align='absmiddle'><a href='admin.php?controller=admin_autorun&action=auto_result_detail&id={{$alldev[t].id}}&autorun_index_id={{$autorun_index_id}}&device_id={{$alldev[t].device_id}}&autotemplate_id={{$autotemplate.id}}'>对比</a></td>
			</tr>
			{{/section}}
			
			<tr>
				<td  colspan="3" align="left">	
				</td>
			
				<td colspan="10" align="right">
					共{{$command_num}}执行命令  {{$page_list}}  页次：{{$curr_page}}/{{$total_page}}页  {{$items_per_page}}条日志/页  转到第<input name="pagenum" type="text" class="wbk" size="2" onKeyPress="if(event.keyCode==13) window.location='admin.php?controller=admin_session&action=dangerlist&page='+this.value;">页
				</td>
			</tr>
			</form>
		
</form>
		</table>
	</td>
  </tr>
</table>
<script language="javascript">
window.parent.menu.document.getElementById('devtree').style.display='none';
window.parent.menu.document.getElementById('ldaptree').style.display='none';

function my_confirm(str){
 return confirm(str);
}
function chk_form(){
    return true;
}
</script>

</body>
<iframe name="hide" height="0" frameborder="0" scrolling="no"></iframe>
</html>



