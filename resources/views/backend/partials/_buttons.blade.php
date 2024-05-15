



    @if (auth()->user()->hasRole('super_admin'))
    <a href="{{route('dashboard.'. $routeName . '.edit', $row)}}" class="btn btn-sm btn-warning" title="@lang('site.edit')"><i class="fa fa-edit"></i></a>
    @endif
    @if (auth()->user()->hasRole('super_admin'))
    <form action=" {{ route('dashboard.'. $routeName . '.destroy',  $row) }} " method="post" style="display:inline-block">
    @csrf
    @method('delete')
    <button type="submit" class="btn btn-danger btn-sm delete" title="@lang('site.delete')"><i class="fa fa-trash"></i> </button>
    </form>
    @endif
