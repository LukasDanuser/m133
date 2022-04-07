<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';

class TotpCodeInput
{
    static function create($name, $autofocus = false)
    {
        global $config;
        ?>
        <div id="codeInputs" class="onlyIfScripts">
            <?php for ($i = 0; $i < $config['auth']['2fa']['digits']; $i++) { ?>
                <input type="text" name="<?= $name ?>[<?= $i ?>]" required
                       pattern="^\d$" <?= ($i === 0 && $autofocus) ? 'autofocus' : '' ?>>
            <?php } ?>
        </div>
        <noscript>
            <input type="text" name="<?= $name ?>[0]" required pattern="^\d{<?= $config['auth']['2fa']['digits'] ?>}$">
        </noscript>

        <script>
            for (const inputElem of document.querySelectorAll('input[name^="<?= $name ?>"]')) {
                inputElem.addEventListener('keydown', ev => {
                    /* Keep default behavior for enter, ctrl+v, cmd+v */
                    if (!(
                        ev.key === 'Enter' ||
                        (ev.ctrlKey && ev.key === 'v') ||
                        (ev.metaKey && ev.key === 'v') /* cmd+v (Mac) */
                    )) {
                        ev.preventDefault();
                    }

                    switch (ev.key) {
                        case 'Backspace':
                            inputElem.value = '';
                            inputElem.previousElementSibling?.focus();
                            break;
                        case 'Delete':
                            inputElem.nextElementSibling?.focus();
                            if (inputElem.nextElementSibling)
                                inputElem.nextElementSibling.value = '';
                            break;
                        case 'ArrowLeft':
                            inputElem.previousElementSibling?.focus();
                            break;
                        case 'ArrowRight':
                            inputElem.nextElementSibling?.focus();
                            break;
                        case '0':
                        case '1':
                        case '2':
                        case '3':
                        case '4':
                        case '5':
                        case '6':
                        case '7':
                        case '8':
                        case '9':
                            inputElem.value = ev.key;
                            inputElem.nextElementSibling?.focus();
                            break;
                    }
                });

                inputElem.addEventListener('paste', ev => {
                    ev.preventDefault();
                    const pastedText = ev.clipboardData.getData('text/plain');
                    let currentInput = inputElem;
                    for (const digit of pastedText) {
                        if (digit.charCodeAt(0) >= '0'.charCodeAt(0) && digit.charCodeAt(0) <= '9'.charCodeAt(0)) {
                            currentInput.value = digit;
                            currentInput = currentInput.nextElementSibling;
                            currentInput?.focus();
                        }
                    }
                });
            }
        </script>
        <?php
    }

    static function getValue($name)
    {
        global $config;

        $code = '';

        if (count($_POST[$name]) > 1) {
            for ($i = 0; $i < $config['auth']['2fa']['digits']; $i++) {
                $code .= $_POST['code'][$i];
            }
        } else {
            $code = $_POST[$name][0];
        }

        return $code;
    }
}