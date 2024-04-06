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
        Schema::create('project_subcontractors', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('project_id');
            $table->bigInteger('subcontractor_id');
            $table->date('start_date')->nullable();
            $table->date('end_date')->nullable();
            $table->float('amount')->default(0);
            $table->string('file')->nullable();
            $table->string('notes')->nullable();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('project_subcontractors');
    }
};
