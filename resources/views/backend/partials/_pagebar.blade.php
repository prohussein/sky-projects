<div class="app-title">
        <div>
          <h1><i class="fa fa-dashboard"></i> {{ $title }}</h1>
          <p class="ml-4">{{ $des }}</p>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"> <a href="#"><i class="fa fa-home fa-lg"></i></a> </li>

           {{ $slot }}
        </ul>
      </div>
