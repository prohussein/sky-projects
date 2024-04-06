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
        Schema::create('revenues', function (Blueprint $table) {
            $table->id();
            $table->string('code')->unique();
            $table->bigInteger('customer_id');
            $table->bigInteger('project_id')->nullable();
            $table->date('date')->nullable();
            $table->float('total_amount');
            $table->enum('tax_type', ['flat', 'percent' ])->default('flat');
            $table->float('tax_amount');
            $table->float('net_amount');
            $table->timestamps();
        }); 
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('revenues');
    }
};
