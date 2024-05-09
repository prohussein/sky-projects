<?php

namespace App\Exports;

use Carbon\Carbon;
use App\Models\Asset;
use App\Models\Project;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;

class ProjectsExport implements FromView, ShouldAutoSize
{


    public function view(): View
    {
        return view('backend.projects.excell', [
            'rows' => Project::with('customer', 'subcontractors', 'expenses', 'items', 'revenues')->orderBy('id', 'desc')->get(),
            'routeName' => 'projects',
        ]);
    }



}
