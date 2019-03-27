<#macro login path isRegisterForm>
<form action="${path}" method="post">
    <div class="form-group row mt-2">
        <label class="col-sm-2 col-form-label"> User Name :</label>
        <div class="col-sm-6">
            <input class="form-control" placeholder="Enter name" type="text" name="username"/>
        </div>
    </div>
    <div class="form-group row mt-2">
        <label class="col-sm-2 col-form-label"> Password:</label>
        <div class="col-sm-6">
            <input class="form-control" placeholder="Password" type="password" name="password"/>
        </div>
    </div>
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <#if !isRegisterForm><a href="/registration">Add new user</a></#if>
    <button class="btn btn-primary" type="submit"><#if isRegisterForm>Create<#else>Sign In</#if></button>
</form>
</#macro>

<#macro logout>
<form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <input type="submit" value="Sign Out"/>
</form>
</#macro>