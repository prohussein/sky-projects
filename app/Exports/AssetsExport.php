<?php

namespace App\Exports;

use Carbon\Carbon;
use App\Models\Asset;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;

class AssetsExport implements FromCollection, WithHeadings, WithMapping, ShouldAutoSize
{
    use Exportable;

    /**
     * @return \Illuminate\Support\Collection
     */
    public function collection()
    {
        if ($_GET['type']) {
            $assets = Asset::when(request('type'), function ($q) {
                $q->where('type', $_GET['type']);
            })->get();
        }else{

            $assets = Asset::all();
        }
        return  $assets;
    }
    /**
     * @return array
     */

    public function map($asset): array
    {
        return [

            $asset->name,
            $asset->type,
            $asset->amount,
            ($asset->file !=  null ? asset('public/uploads/assets/' . $asset->file)  : '') ,
            $asset->descripton,

        ];
    }

    public function headings(): array
    {
        return [
            'الاسم',
            'النوع',
            'القيمة',
            'المستند',
            'الوصف',


        ];
    }
}
