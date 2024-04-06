<?php

use Illuminate\Database\Seeder;

class CategoriesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
         $array = [  
                'brand_id' => 1,
                'name_ar' => 'ليف حمام راقي',
                'name_en' => 'Lev upscale bath',
              
            ];
            
            $cat = \App\Models\Category::create($array);
    }
}
