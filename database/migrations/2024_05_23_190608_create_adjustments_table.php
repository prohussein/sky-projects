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
        Schema::create('adjustments', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('safe_id');
            $table->bigInteger('receiver_safe_id')->nullable();
            $table->bigInteger('user_id');
            $table->float('total_expenses' , 12,2)->default(0);
            $table->float('safe_balance', 12, 2)->default(0);
            $table->float('total_transfares', 12, 2)->default(0);
            $table->text('notes')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('adjustments');
    }
};
