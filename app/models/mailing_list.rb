class MailingList

  LIST_ID = "b630bc5792"

  def self.subscribe(camper)
    gb = Gibbon::API.new
    list_id = camper.camp.list_id

    # subscribe camper
    if camper.email
      user = gb.lists.subscribe({
        :id => LIST_ID,
        :email => {
          :email => camper.email
        },
        :merge_vars => {
          :FNAME => camper.first_name || "",
          :LNAME => camper.last_name || ""
          },
          :update_existing => true,
          :double_optin => false
      })

      gb.lists.static_segment_members_add({
        :id => LIST_ID,
        :seg_id => list_id,
        :batch => [
          :euid => user["euid"]
        ]
      })
    end

    # if mother's email provided, subscribe mother
    if camper.mother_email
      mother = gb.lists.subscribe({
        :id => LIST_ID,
        :email => {
          :email => camper.mother_email
        },
        :merge_vars => {
          :FNAME => camper.mother_first_name || "",
          :LNAME => camper.mother_last_name || ""
          },
          :update_existing => true,
          :double_optin => false
      })

      gb.lists.static_segment_members_add({
        :id => LIST_ID,
        :seg_id => list_id,
        :batch => [
          :euid => mother["euid"]
        ]
      })
    end

    # if father's email provided, subscribe father
    if camper.father_email
      father = gb.lists.subscribe({
        :id => LIST_ID,
        :email => {
          :email => camper.father_email
        },
        :merge_vars => {
          :FNAME => camper.father_first_name || "",
          :LNAME => camper.father_last_name || ""
          },
          :update_existing => true,
          :double_optin => false
      })

      gb.lists.static_segment_members_add({
        :id => LIST_ID,
        :seg_id => list_id,
        :batch => [
          :euid => father["euid"]
        ]
      })
    end
  end

  def self.new_camp_segment(camp)
    gb = Gibbon::API.new
    segment = gb.lists.static_segment_add({
      :id => LIST_ID,
      :name => camp.report_name
    })['id']
    return segment
  end

  def self.update_camp_segment(camper, new_camp_id)
    gb = Gibbon::API.new
    old_list_id = camper.camp.list_id
    new_list_id = Camp.find(new_camp_id).list_id

    if camper.email
      binding.pry
      gb.lists.static_segment_members_del({
        :id => LIST_ID,
        :seg_id => old_list_id,
        :batch => [
          :email => camper.email
        ]
      })

      gb.lists.static_segment_members_add({
        :id => LIST_ID,
        :seg_id => new_list_id,
        :batch => [
          :email => camper.email
        ]
      })
    end

    if camper.mother_email
      gb.lists.static_segment_members_del({
        :id => LIST_ID,
        :seg_id => old_list_id,
        :batch => [
          :email => camper.mother_email
        ]
      })

      gb.lists.static_segment_members_add({
        :id => LIST_ID,
        :seg_id => new_list_id,
        :bath => [
          :email => camper.mother_email
        ]
      })
    end

    if camper.father_email
      gb.lists.static_segment_members_del({
        :id => LIST_ID,
        :seg_id => old_list_id,
        :batch => [
          :email => camper.father_email
        ]
      })

      gb.lists.static_segment_members_add({
        :id => LIST_ID,
        :seg_id => new_list_id,
        :bath => [
          :email => camper.father_email
        ]
      })
    end
  end

end

