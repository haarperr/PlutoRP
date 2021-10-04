let ValidAccounts = {},
  CurrentTransactions = [],
  curAccount = "",
  folder_name = GetParentResourceName();

function UpdateAccount(t, e) {
  $("#" + t + "_Balance").html("$" + e.toLocaleString())
}
let GlobalSteamID = "";

function ResetModals(t, e) {
  $("#depositAmount").val(0), $("#withdrawAmount").val(0), $("#transferAmount").val(0), $("#depositNote").val(""), $("#withdrawNote").val(""), $("#transferNote").val(""), $("#transferID").val(1), curAccount = t, e && "undefined" !== e && (GlobalSteamID = e)
}
var lang = [];
lang.personal = "Personal Account", lang.business = "Buisness Account", lang.friend = "Shared Account", lang.deposit = "Deposit", lang.withdraw = "Withdrawal", lang.transfer = "Transfer";
var relang = [];

function AddAccount(t, e, a, o, n) {
  t.replace(/"|'/g, "");
  let i = t.replace(/\s+/g, ""),
    s = relang[e];
  if (ValidAccounts[i]) return UpdateAccount(i, a);
  $("#Player_Accounts").append("<div id='" + i + "'        <div class='card bg-secondary'>            <div class='account'>                <h5 class='card-title note'>" + t + ("personal" === relang[e] && " <i OnClick='EditAccount(\"" + s + "\")' class='justify-content-end right fa fa-cog account_settings'></i>" || "") + "</h5>                <p class='card-subtitle note'>" + e + "</p>                <div class='row'>                    <div class='col'>                        <p class='card-subtitle mb-2'>" + o + "</p>                    </div>                    <div class='col mb-2'>                        <div class='d-flex justify-content-end'>                            <h5 id='" + i + "_Balance' class='odometer'>$" + a.toLocaleString() + "</h5>                        </div>                        <div class='d-flex justify-content-end mt-1 mb-1'>                            <p class='card-subtitle'>Available Balance</p>                                                    </div>                    </div>                </div>                <hr>                <div class='d-flex justify-content-between'>                    <button type='button' class='btn btn-light mb-2 text-muted deposit' data-toggle='modal' data-target='#DepositModal' onClick='ResetModals(\"" + s + '", "' + n + "\")'>DEPOSIT</button>                    <button type='button' class='btn btn-light mb-2 text-muted withdraw' data-toggle='modal' data-target='#WithdrawModal' onClick='ResetModals(\"" + s + '", "' + n + "\")'>WITHDRAW</button>                    <button type='button' class='btn btn-light mb-2 text-muted transfer' data-toggle='modal' data-target='#TransferModal' onClick='ResetModals(\"" + s + '", "' + n + "\")'>TRANSFER</button>                </div>            </div>    </div><br/></div>"), ValidAccounts[i] = s
}

function timeSince(t) {
  var e = Math.floor((new Date - t) / 1e3),
    a = e / 31536e3;
  return a > 1 ? Math.floor(a) + " years" : (a = e / 2592e3) > 1 ? Math.floor(a) + " months" : (a = e / 86400) > 1 ? Math.floor(a) + " days" : (a = e / 3600) > 1 ? Math.floor(a) + " hours" : (a = e / 60) > 1 ? Math.floor(a) + " minutes" : Math.floor(e) + " seconds"
}

function htmlEncode(t) {
  return $("<div>").text(t).html()
}

function addNote(t) {
  return "<div>        <hr>            <h6 class='note'>Note</h6>            <p class='note'>" + htmlEncode(t) + "</p>        </hr>    </div>"
}

function AddTransaction(t, e, a, o, n, i, s, l) {
  if (CurrentTransactions[t]) return;
  let c = "-" === a.toString().charAt(0) ? "expense" : "addition",
    d = (new Date, timeSince(new Date(o))),
    r = "-" === a.toString().charAt(0) && "-$" + parseInt(a.toString().substring(1, a.length)).toLocaleString() || "+$" + a.toLocaleString();
  $("#Transaction_Row").prepend("        <div class='card bg-secondary mb-2'>            <div class='card-body'>                <div class='col'>                \x3c!-- Header --\x3e                <div class='row game-header'>                    <div class='col'>                        <p class='header-title'> " + lang[e] + "</p>                    </div>                    <div class='col d-flex justify-content-end'>                        <p class='header-title'><span class='badge bg-primary'>Bank Transfer</span> <> <span class='badge bg-dark'>" + lang[i] + "</span></p>                    </div>                    <hr/>                    <div class='col-2'>                        <b class='" + c + "'> " + r + "</b>                    </div>                    <div class='col-5'>                        " + ("N/A" === s && l || s) + "                    </div>                        <div class='col d-flex justify-content-end'>                            <div>                                <p class='note'>" + d + " ago</p>                                <p class='note'> " + l + "</p>                            </div>                        </div>                    " + ("" != n && addNote(n) || "") + "                    </div>                </div>            </div>        </div>    "), CurrentTransactions[t] = !0
}

function OpenATM(t, e, a, o) {
  if (t && null !== t) {
    let e = JSON.parse(t);
    for (var n = 0; n < e.length; n++) {
      let t = e[n];
      AddAccount("business" === t.type && t.name || "Personal Account", lang[t.type] && lang[t.type] || t.type, t.amount, o)
    }
  }
  if (e && null !== e) {
    e = JSON.parse(e);
    for (n = 0; n < e.length; n++) {
      let t = e[n];
      AddAccount(t.owner, "Shared Account", t.amount, o, t.id)
    }
  }
  if (a && null !== a) {
    a = JSON.parse(a);
    for (n = 0; n < a.length; n++) {
      let t = a[n];
      AddTransaction(t.trans_id, t.account, t.amount, t.date, t.message, t.trans_type, t.receiver || "Unknown", o)
    }
  }
  $("#bankui").fadeTo(10, 1)
}

function confirmDeposit() {
  let t = $("#depositAmount").val();
  if (!t || t <= 0) return;
  let e = $("#depositNote").val();
  $("#DepositModal").modal().hide(), $(".modal-backdrop").remove(), $.post("http://" + folder_name + "/DepositCash", JSON.stringify({
    account: curAccount,
    amount: t,
    note: e,
    steamid: GlobalSteamID
  }))
}

function confirmWithdraw() {
  let t = $("#withdrawAmount").val();
  if (!t || t <= 0) return;
  let e = $("#withdrawNote").val();
  $(".modal").hide(), $(".modal-backdrop").remove(), $.post("http://" + folder_name + "/WithdrawCash", JSON.stringify({
    account: curAccount,
    amount: t,
    note: e,
    steamid: GlobalSteamID
  }))
}

function confirmTransfer() {
  let t = $("#transferAmount").val(),
    e = $("#transferID").val();
  if (!t || t <= 0) return;
  let a = $("#transferNote").val();
  $("#TransferModal").modal().hide(), $(".modal-backdrop").remove(), $.post("http://" + folder_name + "/TransferCash", JSON.stringify({
    account: curAccount,
    amount: t,
    target: e,
    note: a,
    steamid: GlobalSteamID
  }))
}

function confirmRemove(t, e) {
  $("#editAccountModal").is(":visible") && $("#editAccountModal").modal("toggle"), $.post("http://" + folder_name + "/RemoveAccess", JSON.stringify({
    target: t,
    player: e
  }))
}

function EditAccount(t) {
  if ("personal" != t) return TropixNotification("Company accounts have no settings yet, sorry!", "error");
  $.post("http://" + folder_name + "/EditAccount", JSON.stringify({}))
}

function TropixNotification(t, e) {
  $("#notifaction_type").text("error" == e ? "Error!" : "Success!"), $("#notification_msg").text(t), $("#notificationModal").modal("toggle")
}
relang["Personal Account"] = "personal", relang["Buisness Account"] = "business", relang["Shared Account"] = "friend";
let Listeners = [];

function closeNotification(t) {
  if (t) return $("#editAccountModal").modal("toggle");
  $("#notificationModal").modal("toggle")
}

function CloseUIPls() {
  $("#editAccountModal").is(":visible") && $("#editAccountModal").modal("toggle"), $("#notificationModal").is(":visible") && $("#notificationModal").modal("toggle"), $("#bankui").fadeTo(10, 0, () => $.post("http://" + folder_name + "/CloseATM", JSON.stringify({})))
}
Listeners.notification = function (t) {
  $("#notifaction_type").text(t.msg_type && "error" == t.msg_type ? "Error!" : "Success!"), $("#notification_msg").text(t.message), $("#notificationModal").modal("toggle")
}, Listeners.OpenUI = function (t) {
  let e = t.name;
  OpenATM(t.accounts, t.friends, t.transactions, e)
}, Listeners.edit_account = function (t) {
  if (t) {
    {
      let a = JSON.parse(t.auths);
      $("#who_has_access").html("");
      for (var e = 0; e < a.length; e++) {
        let t = a[e],
          o = (new Date, timeSince(new Date(t.date_added)));
        $("#who_has_access").append("<tr>            <td>" + t.target_name + "</td>            <td>" + o + "(s) ago</td>            <td><button class='btn btn-danger btn-sm' onclick='confirmRemove(\"" + t.target_identifier + '", "' + t.target_name + "\")'>Remove</button></td>            ")
      }
    }
    $("#editAccountModal").modal("toggle")
  } else TropixNotification("Nobody has access to your bank!", "error")
}, Listeners.refresh_accounts = function () {
  for (var t in ValidAccounts) {
    let e = ValidAccounts[t];
    (e && "business" === e || "friend" === e) && (ValidAccounts[t] = null, $("#" + t).remove(), $("#Player_Accounts").find("br:last-child").remove())
  }
}, $(function () {
  window.addEventListener("message", t => {
    let e = t.data.type;
    Listeners[e] && Listeners[e](t.data)
  }), document.onkeyup = function (t) {
    27 == t.which && ($("#editAccountModal").is(":visible") && $("#editAccountModal").modal("toggle"), $("#notificationModal").is(":visible") && $("#notificationModal").modal("toggle"), $("#DepositModal").is(":visible") && $("#DepositModal").modal().hide(), $("#WithdrawModal").is(":visible") && $("#WithdrawModal").modal().hide(), $("#TransferModal").is(":visible") && $("#TransferModal").modal().hide(), $(".modal-backdrop").remove(), $("#bankui").fadeTo(10, 0, () => $.post("http://" + folder_name + "/CloseATM", JSON.stringify({}))))
  }
}), $(function () {
  $("bankui").hide()
});