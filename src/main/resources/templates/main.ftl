<#import "parts/common.ftl" as c>

<@c.page>
<div class="form-row">
    <form method="get" action="main" class="form-inline">
        <input class="form-control" placeholder="name" type="text" name="name" value="${name?if_exists}">
        <button class="btn btn-primary ml-2" type="submit">search</button>
    </form>
</div>
<a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
   aria-controls="collapseExample">
    add new person
</a>
<div class="collapse" id="collapseExample">
    <div class="form-group">
        <form method="post" action="main" enctype="multipart/form-data">
            <input type="text" name="name" placeholder="введите имя"/>
            <input type="text" name="email" placeholder="введите email"/>
            <div class="custom-file">
                <input type="file" name="file" id="customFile">
            </div>
            <button class="btn btn-primary" type="submit">add</button>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        </form>
    </div>
</div>

<div class="card-columns">
    <#list persons as person>
        <div class="card my-3">
            <#if person.filename??>
                <img class="card-img-top" src="/img/${person.filename}">
            </#if>
            <div class="m-2">
                <span>${person.name}</span>
                <i>${person.email}</i>
            </div>
            <div class="card-footer text-muted">
            ${person.author.username}
            </div>
        </div>
    </#list>
    </body>
</div>
</@c.page>