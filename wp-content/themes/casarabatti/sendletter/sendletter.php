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
        if (($tabCounter % 4) == 0) {
            $interessi .= '<div class="checkbox">';
        }
        $interessi .= '<label class="checkbox-inline"><input type="checkbox" class="chk" value="' . $row['ID'] . '" ';
        $isIn = false;
        $Nint = count($_SESSION['interesse_back']);
        for ($i = 0; $i < $Nint; $i++) {
            if ($row['ID'] == $_SESSION['interesse_back'][$i])
                $isIn = true;
        }
        if ($isIn) {
            $interessi .= " checked";
        }
        $interessi .= ">" . $row['nome'];
        $interessi .= "</label>";
        if (($tabCounter % 4) == 3) {
            $interessi .= "</div>";
        }
        $tabCounter++;
    }

} catch (mysqli_sql_exception $error) {
    die;
}


?>
<style>
    .alert {
        display: none;
    }
</style>
<div class="container-fluid">
    <div class="row">
        <div class="col-xs-12">
            <h1>Newsletter</h1>
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
            <label for="invia-a">Invia a</label>
            <button type="submit" id="toggle-selection" class="btn btn-default">Seleziona Tutti</button>
            <?php echo $interessi; ?>
            <div class="alert alert-danger" id="interessi-error" role="alert">Non hai selezionato nessun interesse.
            </div>
        </div>
        <div class="form-group">
                <textarea name="editor1" id="text-newsletter" rows="10" cols="80">
                    <?php echo $_SESSION['message_back']; ?>
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
