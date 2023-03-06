if @purchase.instance_of? Purchase
  json.purchase do
    json.id @purchase.id
    json.user @purchase.user_id
    json.purchase_option @purchase.purchase_option_id
    json.created_at @purchase.created_at
    json.updated_at @purchase.updated_at
  end
else
  json.purchase do
    json.message @purchase
  end
end
