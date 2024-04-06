<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('expenses', function (Blueprint $table) {
            $table->enum('type', ['materials', 'general' , 'subcontractor','tempwages', 'permanentwages' , 'other'])->default('general');
            $table->bigInteger('project_id')->nullable();
            $table->bigInteger('subcontractor_id')->nullable();
            $table->bigInteger('user_id')->nullable();
            $table->bigInteger('employee_id')->nullable();
            $table->string('material_name')->nullable();
            $table->float('material_qty')->nullable();


        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('expenses', function (Blueprint $table) {
            //
        });
    }
};
