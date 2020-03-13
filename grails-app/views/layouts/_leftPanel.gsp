<div class="sidebar-menu">
    <div class="sidebar-header">
        <div class="logo">
            <a href="#">
                <img src="${resource(dir: 'images', file: 'logo.png')}">
            </a>
        </div>
    </div>

    <div class="main-menu">
        <div class="menu-inner">
            <nav>
                <ul class="metismenu" id="menu">
                    <li class="active">
                        <g:link controller="home" action="index">
                            <i class="ti-dashboard"></i><span>dashb--oard</span></a>
                        </g:link>
                    </li>

                    <li>
                        <a href="javascript:void(0)" aria-expanded="true"><i class="ti-car"></i><span>Car</span></a>
                        <ul class="collapse">
                            <li>
                                <g:link controller="car" action="index"><i class="ti-plus"></i><span>Add</span></g:link>
                            </li>
                            <li><a href="#"><i class="ti-pencil"></i><span>Edit</span></a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>