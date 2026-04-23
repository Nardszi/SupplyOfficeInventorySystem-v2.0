<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void {
        Schema::create('items', function (Blueprint $table) {
            $table->id();
            $table->string('stock_number')->unique();
            $table->string('item_name');
            $table->string('brand')->nullable();
            $table->string('model')->nullable();
            $table->string('serial_number')->nullable();
            $table->enum('category', ['office_supplies','ict_office_supplies','cleaning_supplies','agronomic_supplies']);
            $table->enum('unit', ['PCS','REAM','BOX','SET','BOTTLE','PACK','LITER','MILLILITER','GALLON','METER','CENTIMETER','KILOGRAM','GRAM','ROLL','CAN','TUBE','BAG','SACK'])->default('PCS');
            $table->text('description')->nullable();
            $table->decimal('price', 10, 2)->default(0);
            $table->integer('quantity')->default(0);
            $table->foreignId('added_by')->nullable()->constrained('users')->nullOnDelete();
            $table->timestamp('date_added')->useCurrent();
            $table->timestamps();
        });
    }
    public function down(): void { Schema::dropIfExists('items'); }
};
