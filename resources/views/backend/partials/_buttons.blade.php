
    @if ($routeName != 'orders')


    @if (auth()->user()->hasPermission('update_'.$routeName .''))
    <a href="{{route('dashboard.'. $routeName . '.edit', $row)}}" class="btn btn-sm btn-warning" title="@lang('site.edit')"><i class="fa fa-edit"></i></a>
    @else
    <button type="button" class="btn btn-sm btn-warning" disabled><i class="fa fa-edit"></i> &#x1F625;</a>
    @endif

    @endif
    @if (auth()->user()->hasPermission('delete_'.$routeName .''))
    <form action=" {{ route('dashboard.'. $routeName . '.destroy',  $row) }} " method="post" style="display:inline-block">
    @csrf
    @method('delete')
    <button type="submit" class="btn btn-danger btn-sm delete" title="@lang('site.delete')"><i class="fa fa-trash"></i> </button>
    </form>
    @else
    <button type="button" class="btn btn-danger btn-sm delete" disabled><i class="fa fa-trash"></i>  &#x1F625;</button>
    @endif
