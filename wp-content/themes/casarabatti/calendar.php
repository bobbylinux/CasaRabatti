<div class="wrap">
    <h2>Calendario</h2>
    <div id='calendar'></div>
</div>
<!-- Modal -->
<div class="modal fade" id="new-event-detail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Nuova Prenotazione</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="cliente">Cliente</label>
                    <input type="text" class="form-control" id="cliente" placeholder="Cliente">
                </div>
                <div class="form-group">
                    <label for="cliente">Ambiente</label>
                    <select class="form-control" id="ambiente" placeholder="Ambiente">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                        <option>6</option>
                        <option>7</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="arrivo">Arrivo</label>
                    <input type="text" class="form-control" id="arrivo-cal" placeholder="Arrivo">
                </div>
                <div class="form-group">
                    <label for="partenza">Partenza</label>
                    <input type="text" class="form-control" id="partenza-cal" placeholder="Partenza">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Annulla</button>
                <button type="button" class="btn btn-primary">Salva</button>
            </div>
        </div>
    </div>
</div>