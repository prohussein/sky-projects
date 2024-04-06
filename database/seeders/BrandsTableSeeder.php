<?php

use Illuminate\Database\Seeder;

class BrandsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
         $array = [  
                'name_ar' => 'ليف مطبخ',
                'name_en' => 'Lev kitchen',
              
            ];

           
            
            $brand = \App\Models\Brand::create($array);
          
    }
}
