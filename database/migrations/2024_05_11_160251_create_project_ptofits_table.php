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
        Schema::create('project_ptofits', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('project_id');
            $table->bigInteger('safe_id')->nullable();
            $table->float('customer_cost',12,2);
            $table->float('estimate_cost', 12,2);
            $table->float('actual_cost', 12,2);
            $table->float('profit', 12, 2);
            $table->text('notes')->nullable();
            $table->enum('type', ['profit', 'loss']);
            $table->bigInteger('user_id');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('project_ptofits');
    }
};
