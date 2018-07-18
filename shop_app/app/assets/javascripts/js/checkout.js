function load_steps_checkout(id_tab) {
  for (let i = 1; i <= 5; i++){
    var div_show  = document.getElementById('step-'+i);
    var order_show  = document.getElementById('order-step-'+i);
    var temp = true;
    var show_modal; 
    if (i === id_tab) {
      if (id_tab === 2) {
        var checkbox = document.getElementById('cb_receiver');
        for (let i = 1; i <= 7; i++) {
          var object_address  = document.getElementById('object_address_'+i);
          var object_billing  = document.getElementById('object_billing_'+i);
          if (object_address.value === "" && object_address.placeholder !== "Company") {
            temp = false;
            var p_node = document.createElement("P");
            var text_pnode = document.createTextNode("Please fill info " + object_address.placeholder);
            p_node.appendChild(text_pnode);
            document.getElementById("div-cus-"+i).appendChild(p_node);
            p_node.classList.add("mystyle");
            var child = document.getElementById("p_cus_"+i);
            if (child !== null) {
              document.getElementById("div-cus-"+i).removeChild(child);
            }
            p_node.setAttribute("id", "p_cus_"+i);

            var p_modal = document.createElement("P");
            var modal_text = document.createTextNode("Please fill info " + object_address.placeholder);
            p_modal.appendChild(modal_text);
            var myModal = document.getElementById("myModal");
            myModal.appendChild(p_modal);
            p_modal.classList.add("mystyle");
            var modal_child = document.getElementById("p_cus_modal_"+i);
            if (modal_child !== null) {
              myModal.removeChild(modal_child);
            }
            p_modal.setAttribute("id", "p_cus_modal_"+i);

            show_modal = document.getElementById("p_cus_modal_"+i);
          } else {
            var child = document.getElementById("p_cus_"+i);
            if (child !== null) {
              document.getElementById("div-cus-"+i).removeChild(child);
            }

            var modal_child = document.getElementById("p_cus_modal_"+i);
            if (modal_child !== null) {
              document.getElementById("myModal").removeChild(modal_child);
            }
          }
          if (checkbox.checked == true) {
            object_billing.value = object_address.value;
          }
          
        }
        if (show_modal !== undefined) {
          $("#modal-cus").modal("show"); 
        }
      }

      if (id_tab === 3) {
        for (let i = 1; i <= 7; i++) {
          var object_billing  = document.getElementById('object_billing_'+i);
          if (object_billing.value === "" && object_billing.placeholder !== "Company") {
            temp = false;
            var p_node = document.createElement("P");
            var text_pnode = document.createTextNode("Please fill info " + object_billing.placeholder);
            p_node.appendChild(text_pnode);
            document.getElementById("div-bill-"+i).appendChild(p_node);
            p_node.classList.add("mystyle");
            var child = document.getElementById("p_bill_"+i);
            if (child !== null) {
              document.getElementById("div-bill-"+i).removeChild(child);
            }
            p_node.setAttribute("id", "p_bill_"+i);

            var p_modal = document.createElement("P");
            var modal_text = document.createTextNode("Please fill info " + object_billing.placeholder);
            p_modal.appendChild(modal_text);
            var myModal = document.getElementById("myModal-bill");
            myModal.appendChild(p_modal);
            p_modal.classList.add("mystyle");
            var modal_child = document.getElementById("p_bill_modal_"+i);
            if (modal_child !== null) {
              myModal.removeChild(modal_child);
            }
            p_modal.setAttribute("id", "p_bill_modal_"+i);
            
            show_modal = document.getElementById("p_bill_modal_"+i);
          } else {
            var child = document.getElementById("p_bill_"+i);
            if (child !== null) {
              document.getElementById("div-bill-"+i).removeChild(child);
            }

            var modal_child = document.getElementById("p_bill_modal_"+i);
            if (modal_child !== null) {
              document.getElementById("myModal-bill").removeChild(modal_child);
            }
          }
        }
        if (show_modal !== undefined) {
          $("#modal-bill").modal("show"); 
        }          
        delivery_time();
      }

      if (temp === true) {
          order_show.classList.add('active');
          div_show.style.display = 'block';
      } else {
        div_show  = document.getElementById('step-'+(i-1));
        order_show  = document.getElementById('order-step-'+(i-1));
        order_show.classList.add('active');
        div_show.style.display = 'block';
      }
    } else {
      order_show.classList.remove('active');
      div_show.style.display = 'none';
    }
  }
}

function load_option_payment(id_tab) {
  for (let i = 1; i <= 3; i++){
    var option_show  = document.getElementById('payment-option-'+i);
    if (i === id_tab) {
      option_show.style.display = 'block';
    } else {
      option_show.style.display = 'none';
    }
  }
}

function delivery_time() {
  var delivery_time = document.getElementById('later');
  var minutes_show = document.getElementById('id-minutes');
  var hours_show = document.getElementById('id-hours');
  if (delivery_time.selected == true) {
    minutes_show.style.display = 'block';
    hours_show.style.display = 'block';
      } else {
    minutes_show.style.display = 'none';
    hours_show.style.display = 'none';
  }
}

function cb_payment_fnc() {
  var btn_payment = document.getElementById('btn_payment');
  var cb_payment = document.getElementById('cb_payment');
  
  if (cb_payment.checked === true) {
    btn_payment.disabled = false;
  } else {
    btn_payment.disabled = true;
  }

}

function cb_receiver_fnc() {
  for (let i = 1; i <= 7; i++) {
    var object_address  = document.getElementById('object_address_'+i);
    var object_billing  = document.getElementById('object_billing_'+i);
    if (cb_receiver.checked == true) {
      object_billing.value = object_address.value;
    } else {
      object_billing.value = "";
    }
  }
}

function select_price_fnc() {
  for (let i = 1; i <= 5; i++) {
    var size = document.getElementById('size_'+i);
    var price = document.getElementById('price_'+i);
    
    if (size) {
      if (size.selected === true) {
        price.selected = true;
      }else {
        price.selected = false;
      }
    }
  }
}

function select_size_fnc() {
  for (let i = 1; i <= 5; i++) {
    var size = document.getElementById('size_'+i);
    var price = document.getElementById('price_'+i);
    
    if (price) {
      if (price.selected === true) {
        size.selected = true;
      }else {
        size.selected = false;
      }
    }
  }
}
