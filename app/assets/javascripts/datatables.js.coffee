$ ->
  $('.datatable').dataTable
    "dom": '<if>rt<lp>'
    "language":
      "info": "_TOTAL_件中 _START_ - _END_ 件を表示"
      "infoEmpty": "0 件"
      "infoFiltered": "（_MAX_ 件から絞り込み）"
      "paginate":
        "next": "次へ"
        "previous": "前へ"
      "processing": "しばらくお待ちください..."
      "search": "絞り込み:"
      "zeroRecords": "データが見つかりません"
    "lengthChange": false
    "pageLength": 50
    "processing": true
