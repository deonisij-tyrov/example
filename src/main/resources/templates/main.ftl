<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
<div>
    <@l.logout />
    <span><a href="/user">user list</a> </span>
</div>
    <div>
        <form method="post" action="main">
            <input type="text" name="name" placeholder="введите имя"/>
            <input type="text" name="email" placeholder="введите email"/>
            <button type="submit">добавить</button>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        </form>
    </div>
    <div>All users</div>
    <form method="get" action="main">
        <input type="text" name="name" value="${name}">
        <button type="submit">найти</button>
    </form>
    <#list persons as person>
    <div>
        <b>${person.id}</b>
        <span>${person.name}</span>
        <i>${person.email}</i>
        <strong>
            ${person.author.username}
        </strong>
    </div>
    </#list>
</body>

</@c.page>