<?php
require_once('../wp-config.php');

try {
    $con = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD);
    mysqli_select_db($con, "casarabatti");

    $query_ambienti = "SELECT * FROM cal_ambienti WHERE inizio < now() and fine is null ORDER by nome asc";

    $return =  mysqli_query($con, $query_ambienti);
    $ambiente = "";
    while ($fetch = mysqli_fetch_array($return, MYSQLI_ASSOC)) {
        $ambiente =  $ambiente.'<option value="'.$fetch['id'].'">'.$fetch['nome'].'</option>';
    }
    $query_clienti = "SELECT id, nome FROM cal_clienti ORDER BY nome, id";

    $return = mysqli_query($con, $query_clienti);

    while ($fetch = mysqli_fetch_array($return, MYSQLI_ASSOC)) {
        $return_arr[] = $fetch['nome'];
    }

} catch (mysqli_sql_exception $error) {
    die;
}
?>
<div class="container-fluid">
    <div class="row" style="margin-top: 2%; margin-bottom: 5%;">
        <div class="col-xs-12">
            <button class="btn btn-block btn-success" id="manage-customer">Gestisci Clienti</button>
        </div>
    </div>


    <div class="row">
        <div class="col-xs-12">
            <div id='calendar'></div>
        </div>
    </div>
</div>
<!-- Modal Event -->
<div class="modal fade" id="event-detail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="PrenotazioneLabel">Nuova Prenotazione</h4>
            </div>
            <div class="modal-body">
                <label for="cliente">Ricerca cliente</label>
                <input type="hidden" id="event-type-hidden" placeholder="Cliente" value="new">
                <input type="hidden" id="event-id-hidden" placeholder="Cliente" value="">
                <div class="input-group">
                    <input type="text" class="form-control" id="ricerca-cliente" placeholder="Cliente">
                    <input type="hidden" id="ricerca-cliente-hidden" placeholder="Cliente" value="">
                    <span class="input-group-btn" id="add-customer" style="cursor:pointer"><button class="btn btn-success" type="button"><i class="fa fa-check"></i></button></span>
                    <span class="input-group-btn" id="new-customer" style="cursor:pointer"><button class="btn btn-primary" type="button"><i class="fa fa-plus"></i></button></span>
                </div>
                <div class="form-group">
                    <label for="cliente">Cliente</label>
                    <input type="text" class="form-control" id="cliente" placeholder="Cliente" disabled data-id="">
                    <div class="alert alert-danger" id="cliente-error" role="alert">Cliente: </div>
                </div>
                <div class="form-group">
                    <label for="ambiente">Ambiente</label>
                    <select class="form-control" id="ambiente" placeholder="Ambiente">
                        <?php echo $ambiente;?>
                    </select>
                    <div class="alert alert-danger" id="ambiente-error" role="alert">Ambiente: </div>
                </div>
                <div class="form-group">
                    <label for="arrivo">Arrivo</label>
                    <input type="text" class="form-control" id="arrivo-cal" placeholder="Arrivo">
                    <div class="alert alert-danger" id="arrivo-error" role="alert">Arrivo: </div>
                </div>
                <div class="form-group">
                    <label for="partenza">Partenza</label>
                    <input type="text" class="form-control" id="partenza-cal" placeholder="Partenza">
                    <div class="alert alert-danger" id="partenza-error" role="alert">Partenza: </div>
                </div>
                <div class="form-group">
                    <label for="partenza">Note</label>
                    <textarea class="form-control" rows="3" id="note" placeholder="Note"></textarea>
                    <div class="alert alert-danger" id="note-error" role="alert">Note: </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Annulla</button>
                <button type="button" class="btn btn-danger btn-elimina-evento">Elimina</button>
                <button type="button" class="btn btn-primary btn-salva-evento">Salva</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal Customer -->
<div class="modal fade" id="customer-detail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="ClienteLabel">Nuovo Cliente</h4>
            </div>
            <div class="modal-body">
                <label for="cliente" id="label-search-customer">Ricerca cliente</label>
                <div class="form-group" id="search-customer">
                    <input type="text" class="form-control" id="ricerca-cliente-edit" placeholder="Cliente" data-id="">
                </div>
                <input type="hidden" id="ricerca-cliente-edit-hidden" placeholder="Cliente" value="">
                <div class="form-group">
                    <label for="cliente">Cognome & Nome</label>
                    <input type="text" class="form-control" id="cognome-nome" placeholder="Cognome & Nome">
                </div>
                <div class="form-group">
                    <label for="email">E-Mail</label>
                    <input type="email" class="form-control" id="email" placeholder="E-Mail">
                </div>
                <div class="form-group">
                    <label for="telefono">Telefono</label>
                    <input type="text" class="form-control" id="telefono" placeholder="Telefono">
                </div>
                <div class="form-group">
                    <label for="indirizzo">Indirizzo</label>
                    <input type="text" class="form-control" id="indirizzo" placeholder="Indirizzo">
                </div>
                <div class="form-group">
                    <label for="citta">Citt&agrave;</label>
                    <input type="text" class="form-control" id="citta" placeholder="Citt&agrave;">
                </div>
                <div class="form-group">
                    <label for="telefono">Nazione</label>
                    <input type="text" class="form-control" id="nazione" placeholder="Nazione">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Annulla</button>
                <button type="button" class="btn btn-primary" id="save-customer">Salva</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade wait-msg" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <div class="progress">
                    <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="100"
                         aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                    </div>
                </div>
                <h4 class="text-center">Attendere Prego</h4>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div><!-- /.modal -->