<?php
session_start();
require_once('../wp-config.php');
require_once "../wp-content/themes/casarabatti/sendletter/log.php";

try {
    $con = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD);
    mysqli_select_db($con, "casarabatti");

    $result = mysqli_query($con, 'SELECT ID, nome FROM interessi ORDER BY nome ASC');

    $tabCounter = 0;
    while ($row = mysqli_fetch_assoc($result)) {
        $tabellaInteressi .= '<tr><td class="col-xs-8"><span class="interesse-td">'.stripslashes($row["nome"]).'</span><input type="text" class="form-control interesse-edit-input" value="'.$row["nome"].'" ></td><td class="col-xs-4 text-right"><button type="button" class="btn btn-primary btn-edit-interesse" data-id="'.$row["ID"].'">Modifica</button><button type="button" class="btn btn-danger btn-del-interesse" data-id="'.$row["ID"].'">Elimina</button></td></tr>';


    }

    $result_join = mysqli_query($con,"SELECT ID, nome FROM interessi INNER JOIN interessi_soci ON id = id_interesse");
    $tabCounter = 0;
    while ($row_join = mysqli_fetch_assoc($result_join)) {
        if (($tabCounter % 4) == 0) {
            $interessi .= '<div class="checkbox">';
        }
        $interessi .= '<label class="checkbox-inline"><input type="checkbox" class="chk" value="' . $row_join['ID'] . '" ';
        $interessi .= ">" . stripslashes($row_join['nome']);
        $interessi .= "</label>";
        if (($tabCounter % 4) == 3) {
            $interessi .= "</div>";
        }
        $tabCounter++;
    }

} catch (mysqli_sql_exception $error) {
    die;
}

//gestione interessi
?>
<style>

    .wait-msg, .error-msg {
        top:25%;
        left: 10%;

    }
    .interesse-edit-input {
        display: none;
    }

    .interessi-modal {
        left: 10%;
    }
    .alert {
        display: none;
    }

    form {
        margin-top: 5%;
    }
</style>
<div class="container-fluid">
    <div class="row">
        <div class="col-xs-12">
            <h1>Newsletter</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <!-- Large modal -->
            <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target=".interessi-modal">Gestione Interessi</button>
        </div>
    </div>
    <?php
    ?>
    <form id="form-newsletter">
        <div class="form-group">
            <label for="oggetto">Oggetto</label>
            <input type="text" class="form-control" id="subject-newsletter" placeholder="Oggetto"
                   value="">

            <div class="alert alert-danger" id="subject-error" role="alert">Non hai inserito l'oggetto</div>
        </div>
        <div class="form-group">
            <?php if (isset($interessi)) { ?>
            <label for="invia-a">Invia a</label>
            <button type="submit" id="toggle-selection" class="btn btn-default">Seleziona Tutti</button>
            <?php echo $interessi; } ?>
            <div class="alert alert-danger" id="interessi-error" role="alert">Non hai selezionato nessun interesse.
            </div>
        </div>
        <div class="form-group">
                <textarea name="editor1" id="text-newsletter" rows="10" cols="80">

                </textarea>

            <div class="alert alert-danger" id="message-error" role="alert">Non hai inserito il messaggio.</div>
        </div>
        <input type="hidden" class="form-control" id="all-selected-newsletter" placeholder="Oggetto"
               value="0">
        <div class="form-group">
            <button type="submit" class="btn btn-primary btn-block">Invia</button>
        </div>
    </form>
</div>
<div class="modal fade" tabindex="-1" role="dialog" id="modal-invio">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Newsletter</h4>
            </div>
            <div class="modal-body">
                <p>Inoltro pianificato correttamente, l'invio avverr&agrave; nella notte - E' possibile chiudere la finestra adesso</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">OK</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<div class="modal fade interessi-modal" tabindex="-1" role="dialog" >
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Gestione Interessi</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="page-header">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Interesse</label>
                                <input type="text" class="form-control" id="interesse-input" placeholder="Interesse">
                            </div>
                            <div class="form-group">
                                <button type="button" class="btn btn-block btn-success" id="btn-add-interesse">Aggiungi Interesse</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-12">
                        <table class="table table-striped" id="table-interessi">
                            <thead>
                            <tr><th>Interesse</th><th></th></tr>
                            </thead>
                            <?php echo $tabellaInteressi; ?>
                        </table>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-warning btn-block" data-dismiss="modal">Chiudi</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade wait-msg" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <div class="progress">
                    <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                    </div>
                </div>
                <h4 class="text-center">Attendere Prego</h4>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<div class="modal fade error-msg" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body text-center">
                <h4>Errore</h4>
                <p id="error-msg-text"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger btn-block" data-dismiss="modal">Chiudi</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->