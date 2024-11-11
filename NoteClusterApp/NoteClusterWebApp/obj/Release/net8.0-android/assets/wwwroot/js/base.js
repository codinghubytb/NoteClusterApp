function CopyToClipboard(text) {
    // Créer un élément de texte temporaire
    var textArea = document.createElement('textarea');
    textArea.value = text;
    document.body.appendChild(textArea);

    // Sélectionner le texte
    textArea.select();
    textArea.setSelectionRange(0, 99999); // Pour les mobiles

    // Exécuter la commande de copie
    document.execCommand('copy');

    // Nettoyer
    document.body.removeChild(textArea);
}