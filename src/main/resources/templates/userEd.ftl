<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
<div>
    <@l.logout />
</div>
<form action="/user" method="post">
    <input type="text" name="username" value="${user.username}">
    <input type="file" name="file">
    <#list roles as role>
        <div>
            <label><input type="checkbox"
                          name="${role}" ${user.roleSet?seq_contains(role)?string("checked", "")}>${role}</label>
        </div>
    </#list>
    <input type="hidden" name="userId" value="${user.id}">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <button type="submit">save</button>
</form>
</@c.page>