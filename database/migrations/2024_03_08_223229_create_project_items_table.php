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
        Schema::create('project_items', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('project_id');
            $table->integer('code');
            $table->string('name');
            $table->float('qty');
            $table->float('cat');
            $table->float('item_total');
            $table->float('implement_qty');
            $table->float('total_implement_qty');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('project_items');
    }
};
