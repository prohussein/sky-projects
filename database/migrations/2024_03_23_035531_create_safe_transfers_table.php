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
        Schema::create('safe_transfers', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('from_safe');
            $table->bigInteger('to_safe');
            $table->float('amount');
            $table->float('safe_send_blance');
            $table->float('safe_receive_blance');
            $table->dateTime('transfer_date');
            $table->bigInteger('added_by');
            $table->string('notes');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('safe_transfers');
    }
};
