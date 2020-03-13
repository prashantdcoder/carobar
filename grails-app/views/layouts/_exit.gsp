<div class="col-sm-6 clearfix">
    <div class="user-profile pull-right">
        <img class="avatar user-thumb" src="${assetPath(src: 'avatar/avatar.png')}" alt="avatar">
        <h4 class="user-name dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
            ${username}
            <i class="ti-angle-down"></i></h4>

        <div class="dropdown-menu logout_dropdown" x-placement="bottom-start">
            <a class="dropdown-item" href="#">Profile</a>
            <a class="dropdown-item" href="#">Reset Password</a>
            <a class="dropdown-item" href="#">Log Out</a>
        </div>
    </div>
</div>