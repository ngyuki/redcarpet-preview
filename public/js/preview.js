$(function(){
	
	// API の URL
	var url = 'markdown/raw';
	
	// ファイルが markdown っぽければ true を返す
	function isMarkdownLike(file)
	{
		if (file.size > 1024*1024*2) // 2MB
		{
			return false;
		}
		if (file.name.match(/\.(md|markdown)$/))
		{
			return true;
		}
		if (file.type.match(/^text\//))
		{
			return true;
		}
		return false;
	}
	
	// プレビューを表示
	function showPreview()
	{
		var source = $('#source').val();
		
		if (source.length == 0)
		{
			$('#preview').html(source);
		}
		else
		{
			$.ajax({
				type: 'POST',
				url: url,
				data: source,
				contentType: 'text/plain',
				processData: false,
				dataType: 'text'
			})
			.done(function(data){
				$('#preview').html(data);
			});
		}
	}
	
	// テキストファイルを読み込む
	function readAsText(file)
	{
		var defer = $.Deferred();
		var reader = new FileReader();
		
		reader.onload = function(){
			defer.resolveWith(this, arguments);
		};
		
		reader.readAsText(file, "utf-8");
		
		return defer.promise();
	}
	
	// イベントオブジェクトの dataTransfer を有効にする
	$.event.props.push('dataTransfer');
	
	// ドラッグアンドドロップ
	$('html')
		.on('drop dragenter dragleave dragover', function(ev){
			ev.preventDefault();
		})
		.on('dragenter', function(ev){
			$('#droptarget').show();
		})
	;
	
	$('#droptarget')
		.on('dragleave', function(ev){
			$(this).hide();
		})
		.on('drop', function(ev){
			$(this).hide();
			
			if (ev.dataTransfer && ev.dataTransfer.files)
			{
				var files = ev.dataTransfer.files;
				var textfile = null;
				
				for (var i=0, len=files.length; i<len; i++)
				{
					if (isMarkdownLike(files[i]))
					{
						textfile = files[i];
						break;
					}
				}
				
				if (textfile)
				{
					readAsText(textfile).done(function(ev){
						$("#source").val(ev.target.result);
						showPreview();
					});
				}
			}
		})
	;
	
	// 遅延タイムアウト
	function delayTimeout(msec)
	{
		var defer = $.Deferred();
		var callee = arguments.callee;
		
		if (callee.timer)
		{
			clearTimeout(callee.timer);
		}
		
		callee.timer = setTimeout(function(){
			defer.resolve();
		}, msec);
		
		return defer.promise().always(function(){
			callee.timer = null;
		});
	}
	
	// キーアップ
	$(document).keyup(function(){
		delayTimeout(200).done(function(){
			showPreview();
		});
	});
	
	// 最初の表示
	showPreview();
});
