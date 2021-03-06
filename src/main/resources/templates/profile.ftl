<#import "parts/common.ftl" as c>

<@c.page>
<h5>${username}</h5>
${message?if_exists}
<form method="post">
    <div class="form-group row mt-2">
        <label class="col-sm-2 col-form-label"> Password:</label>
        <div class="col-sm-6">
            <input class="form-control" placeholder="Password" type="password" name="password"/>
        </div>
    </div>
    <div class="form-group row mt-2">
        <label class="col-sm-2 col-form-label"> Email:</label>
        <div class="col-sm-6">
            <input class="form-control" placeholder="Email" type="email" name="email" value="${email!''}"/>
        </div>
    </div>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <button class="btn btn-primary" type="submit">Save</button>
</form>
</@c.page>