<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
<div>
    <@l.logout />
</div>
List of users
<table>
    <thead>
    <tr>
        <th>name</th>
        <th>role</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <#list users as user>
        <tr>
            <td>${user.username}</td>
            <td><#list user.roleSet as role>${role}<#sep >, </#list></td>
            <td><a href="/user/${user.id}">edit</a> </td>
        </tr>
    </#list>
    </tbody>
</table>
</@c.page>