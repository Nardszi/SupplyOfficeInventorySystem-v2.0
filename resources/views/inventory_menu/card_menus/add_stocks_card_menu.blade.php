<div class="card">
    <div class="section-title">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="currentColor"><path d="M19 3H5c-1.11 0-2 .9-2 2v14c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-2 10h-4v4h-2v-4H7v-2h4V7h2v4h4v2z"/></svg>
        Add Items to Catalog
    </div>

    <form method="GET" action="{{ route('inventory') }}" id="addItemsForm">
        <input type="hidden" name="action" value="add_item">
        <input type="hidden" name="panel" value="add_stocks">

        <div id="itemRows">
            <div class="item-row" style="border:1px solid #e5e7eb;border-radius:8px;padding:14px;margin-bottom:12px">
                <div style="display:grid;grid-template-columns:1fr 1fr;gap:12px">
                    <div class="form-group" style="margin:0">
                        <label class="form-label">Item Name <span style="color:#dc2626">*</span></label>
                        <input type="text" name="items[0][item_name]" class="form-input" required>
                    </div>
                    <div class="form-group" style="margin:0">
                        <label class="form-label">Category</label>
                        <select name="items[0][category]" class="form-input" onchange="toggleIctFields(this)">
                            <option value="office">Office Supplies</option>
                            <option value="ict">ICT Supplies</option>
                            <option value="cleaning">Cleaning Supplies</option>
                            <option value="agronomic">Agronomic Supplies</option>
                        </select>
                    </div>
                    <div class="form-group" style="margin:0">
                        <label class="form-label">Brand</label>
                        <input type="text" name="items[0][brand]" class="form-input">
                    </div>
                    <div class="form-group" style="margin:0">
                        <label class="form-label">Unit</label>
                        <select name="items[0][unit]" class="form-input">
                            @foreach(['PCS','REAM','BOX','SET','BOTTLE','PACK','LITER','MILLILITER','GALLON','METER','CENTIMETER','KILOGRAM','GRAM','ROLL','CAN','TUBE','BAG','SACK'] as $u)
                            <option value="{{ $u }}">{{ $u }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="ict-only form-group" style="margin:0;display:none">
                        <label class="form-label">Model</label>
                        <input type="text" name="items[0][model]" class="form-input">
                    </div>
                    <div class="ict-only form-group" style="margin:0;display:none">
                        <label class="form-label">Serial No.</label>
                        <input type="text" name="items[0][serial_number]" class="form-input">
                    </div>
                    <div class="form-group" style="margin:0;grid-column:span 2">
                        <label class="form-label">Description</label>
                        <input type="text" name="items[0][description]" class="form-input">
                    </div>
                </div>
            </div>
        </div>

        <div style="display:flex;gap:10px;margin-top:4px">
            <button type="button" onclick="addRow()" class="btn btn-secondary btn-sm">+ Add Another</button>
            <button type="submit" class="btn btn-primary btn-sm">Save All Items</button>
        </div>
    </form>
</div>

<script>
let rowCount = 1;
const units = ['PCS','REAM','BOX','SET','BOTTLE','PACK','LITER','MILLILITER','GALLON','METER','CENTIMETER','KILOGRAM','GRAM','ROLL','CAN','TUBE','BAG','SACK'];

function toggleIctFields(select) {
    const row = select.closest('.item-row');
    const isIct = select.value === 'ict';
    row.querySelectorAll('.ict-only').forEach(el => {
        el.style.display = isIct ? '' : 'none';
        el.querySelectorAll('input').forEach(inp => inp.value = isIct ? inp.value : '');
    });
}

function addRow() {
    const i = rowCount++;
    const unitOpts = units.map(u => `<option value="${u}">${u}</option>`).join('');
    const html = `
    <div class="item-row" style="border:1px solid #e5e7eb;border-radius:8px;padding:14px;margin-bottom:12px;position:relative">
        <button type="button" onclick="this.closest('.item-row').remove()" style="position:absolute;top:8px;right:8px;background:#fee2e2;color:#dc2626;border:none;border-radius:6px;padding:3px 8px;cursor:pointer;font-size:12px">Remove</button>
        <div style="display:grid;grid-template-columns:1fr 1fr;gap:12px">
            <div class="form-group" style="margin:0">
                <label class="form-label">Item Name <span style="color:#dc2626">*</span></label>
                <input type="text" name="items[${i}][item_name]" class="form-input" required>
            </div>
            <div class="form-group" style="margin:0">
                <label class="form-label">Category</label>
                <select name="items[${i}][category]" class="form-input" onchange="toggleIctFields(this)">
                    <option value="office">Office Supplies</option>
                    <option value="ict">ICT Supplies</option>
                    <option value="cleaning">Cleaning Supplies</option>
                    <option value="agronomic">Agronomic Supplies</option>
                </select>
            </div>
            <div class="form-group" style="margin:0">
                <label class="form-label">Brand</label>
                <input type="text" name="items[${i}][brand]" class="form-input">
            </div>
            <div class="form-group" style="margin:0">
                <label class="form-label">Unit</label>
                <select name="items[${i}][unit]" class="form-input">${unitOpts}</select>
            </div>
            <div class="ict-only form-group" style="margin:0;display:none">
                <label class="form-label">Model</label>
                <input type="text" name="items[${i}][model]" class="form-input">
            </div>
            <div class="ict-only form-group" style="margin:0;display:none">
                <label class="form-label">Serial No.</label>
                <input type="text" name="items[${i}][serial_number]" class="form-input">
            </div>
            <div class="form-group" style="margin:0;grid-column:span 2">
                <label class="form-label">Description</label>
                <input type="text" name="items[${i}][description]" class="form-input">
            </div>
        </div>
    </div>`;
    document.getElementById('itemRows').insertAdjacentHTML('beforeend', html);
}
</script>
