 <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <aside class="app-sidebar">
      <div class="app-sidebar__user">
        @if (auth()->user()->photo)
                <img class="app-sidebar__user-avatar" width="30%" src="{{ url('public/uploads/users', auth()->user()->photo) }}" alt="User Image">
        @else
         <img class="app-sidebar__user-avatar" width="30%" src="{{ url('public/backend/images/avatar.png') }}" alt="User Image">

        @endif
        <div>
          <p class="app-sidebar__user-name"> {{ auth()->user()->name }} </p>
          {{--  <p class="app-sidebar__user-designation">Backend Developer</p>  --}}
        </div>
      </div>
      <ul class="app-menu">

        <li><a class="app-menu__item" href="{{ route('dashboard.index') }}"><i class="app-menu__icon fa fa-dashboard"></i><span class="app-menu__label">@lang('site.dashboard')</span></a></li>
        @if(auth()->user()->hasRole('super_admin'))
        <li><a class="app-menu__item {{ is_active('assets')}}" href="{{ route('dashboard.assets.index') }}"><i class="app-menu__icon fa fa-dashboard"></i><span class="app-menu__label">اصول الشركة</span></a></li>

        <li><a class="app-menu__item {{ is_active('projects')}}" href="{{ route('dashboard.projects.index') }}"><i class="app-menu__icon fa fa-building"></i><span class="app-menu__label">ادارة المشروعات </span></a></li>
        @endif
        {{-- اددارة المشروعات --}}
        <li class="treeview {{ is_expanded('revenues')}} {{ is_expanded('employees')}}  {{ is_expanded('subcontractors')}} {{ is_expanded('customers')}} {{ is_expanded('cost')}} "><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-credit-card-alt"></i><span class="app-menu__label">ادارة التنفيذ</span><i class="treeview-indicator fa fa-angle-right"></i></a>
            <ul class="treeview-menu">

                {{-- @if (auth()->user()->hasPermission('read_projects'))
                <li><a class="treeview-item {{ is_active('projects')}}" href="{{ route('dashboard.projects.index') }}"><i class="icon fa fa-building mr-3"></i>المشروعات</a></li>
                @endif --}}


                <li><a class="treeview-item {{ is_active('manageproject')}}" href="{{ route('dashboard.projects.manage.cost') }}"><i class="icon fa fa-money mr-3"></i>ادارة المشروع</a></li>


                @if (auth()->user()->hasRole('super_admin') || auth()->user()->hasRole('account_manager'))
                <li><a class="treeview-item {{ is_active('revenues')}}" href="{{ route('dashboard.revenues.index') }}"><i class="icon fa fa-money mr-3"></i>المستخلصات</a></li>
               
                <li><a class="treeview-item {{ is_active('customers')}}" href="{{ route('dashboard.customers.index') }}"><i class="icon fa fa-users mr-3"></i>العملاء</a></li>

                <li><a class="treeview-item {{ is_active('subcontractors')}}" href="{{ route('dashboard.subcontractors.index') }}"><i class="icon fa fa-users mr-3"></i>المقاولاين</a></li>

                <li><a class="treeview-item {{ is_active('employees')}}" href="{{ route('dashboard.employees.index') }}"><i class="icon fa fa-users mr-3"></i>الموظفين</a></li>
                @endif
            </ul>
         </li>
        {{-- المصروفات  --}}
        @if(auth()->user()->hasRole('super_admin') || auth()->user()->hasRole('admin') || auth()->user()->hasRole('account_manager'))
        <li class="treeview {{ is_expanded('expenses')}} {{ is_expanded('safes')}} {{ is_expanded('safetransfers')}} {{ is_expanded('expensecategories')}}"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-credit-card-alt"></i><span class="app-menu__label">الادارة المالية</span><i class="treeview-indicator fa fa-angle-right"></i></a>
            <ul class="treeview-menu">

                <li><a class="treeview-item {{ is_active('safes')}}" href="{{ route('dashboard.safes.index') }}"><i class="icon fa fa-tags mr-3"></i>الخزن</a></li>
                <li><a class="treeview-item {{ is_active('safetransfers')}}" href="{{ route('dashboard.safetransfers.index') }}"><i class="icon fa fa-exchange mr-3"></i>تحويلات الخزن</a></li>


                <li><a class="treeview-item {{ is_active('expensecategories')}}" href="{{ route('dashboard.expensecategories.index') }}"><i class="icon fa fa-tags mr-3"></i>@lang('site.expensecategories')</a></li>
               <li><a class="treeview-item {{ is_active('expenses')}}" href="{{ route('dashboard.expenses.index') }}"><i class="icon fa fa-money mr-3"></i>@lang('site.expenses')</a></li>
            </ul>
         </li>
         @endif

        {{-- <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-list"></i><span class="app-menu__label">ادارة الموقع الالكتروني</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">

            @if (auth()->user()->hasPermission('read_categories'))
               <li>
                  <a class="treeview-item {{ is_active('categories') }}" href="{{ route('dashboard.categories.index') }}"><i class="icon fa fa-list"></i><span class="app-menu__label">@lang('site.categories')</span></a>
               </li>

            @endif

            @if (auth()->user()->hasPermission('read_products'))
                  <li><a class="treeview-item {{ is_active('products') }}" href="{{ route('dashboard.products.index') }}"><i class="icon fa fa-shopping-cart"></i><span class="app-menu__label">@lang('site.products')</span></a></li>
            @endif

            @if (auth()->user()->hasPermission('read_sliders'))
            <li><a class="treeview-item {{ is_active('sliders') }}" href="{{ route('dashboard.sliders.index') }}"><i class="icon fa fa-photo"></i><span class="app-menu__label">@lang('site.sliders')</span></a></li>
            @endif
            @if (auth()->user()->hasPermission('read_pages'))
            <li><a class="treeview-item {{ is_active('pages') }}" href="{{ route('dashboard.pages.index') }}"><i class="icon fa fa-file-o"></i><span class="app-menu__label">@lang('site.pages')</span></a></li>
            @endif
              @if (auth()->user()->hasPermission('read_partners'))
            <li><a class="treeview-item {{ is_active('partners') }}" href="{{ route('dashboard.partners.index') }}"><i class="icon fa fa-user"></i><span class="app-menu__label">@lang('site.partners')</span></a></li>
            @endif
             @if (auth()->user()->hasPermission('read_messages'))
            <li><a class="treeview-item {{ is_active('messages') }}" href="{{ route('dashboard.messages.index') }}"><i class="icon fa fa-commenting-o"></i><span class="app-menu__label">@lang('site.messages')</span></a></li>
            @endif




          </ul>
        </li> --}}

        @if(auth()->user()->hasRole('super_admin'))
            <li class="treeview {{ is_expanded('roles')}} {{ is_expanded('users')}} {{ is_expanded('settings')}}"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-gear"></i><span class="app-menu__label">الاعدادات</span><i class="treeview-indicator fa fa-angle-right"></i></a>
            <ul class="treeview-menu">
                @if (auth()->user()->hasPermission('read_users'))
                <li><a class="treeview-item {{ is_active('users') }}" href="{{ route('dashboard.users.index') }}"><i class="icon fa fa-users"></i><span class="app-menu__label">@lang('site.users')</span></a></li>
                @endif
                @if (auth()->user()->hasPermission('read_roles'))
                <li><a class="treeview-item {{ is_active('roles') }}" href="{{ route('dashboard.roles.index') }}"><i class="icon fa fa-anchor"></i><span class="app-menu__label">@lang('site.roles')</span></a></li>
                @endif
                <li><a class="treeview-item" href="{{ route('dashboard.settings.general') }}"><i class="icon fa fa-circle-o"></i> اعدادات عامة</a></li>

                {{-- <li><a class="treeview-item" href="{{ route('dashboard.settings.about') }}"><i class="icon fa fa-circle-o"></i> @lang('about')</a></li>

                <li><a class="treeview-item" href="{{ route('dashboard.settings.social_links') }}"><i class="icon fa fa-circle-o"></i> @lang('social_links')</a></li> --}}

            </ul>
            </li>
        @endif



      </ul>
    </aside>
