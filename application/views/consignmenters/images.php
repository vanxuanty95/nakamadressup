<?php $this->load->view("partial/header"); ?>

<script type="text/javascript">
    $(document).ready(function () {
        <?php $this->load->view('partial/bootstrap_tables_locale'); ?>

        table_support.init({
            resource: '<?php echo site_url($controller_name);?>',
            pageSize: <?php echo $this->config->item('lines_per_page'); ?>,
            uniqueId: 'people.person_id'
        });
    });
</script>

<div id="page_title"><?php echo $person_info->consignmenter_name . ' - ' . $person_info->name ?></div>

<div class="row">
    <div class="col-sm-12">
        <?php foreach ($images as $image) { ?>

            <div class="col-sm-3 padding-md">
                <div class="thumbnail margin-y-zero">
                    <div class="frontpage_square">
                        <img src="<?php echo './uploads/item_pics/' . $image['pic_filename'] ?>"
                             class="img img-responsive full-width"
                             onerror="this.src='data:image/jpeg;base64,/9j/4AAQSkZJRgABAQABLAEsAAD/4QESRXhpZgAATU0AKgAAAAgACAEGAAMAAAABAAIAAAESAAMAAAABAAEAAAEaAAUAAAABAAAAbgEbAAUAAAABAAAAdgEoAAMAAAABAAIAAAExAAIAAAAiAAAAfgEyAAIAAAAUAAAAoIdpAAQAAAABAAAAtAAAAAAAAAEsAAAAAQAAASwAAAABQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKFdpbmRvd3MpADIwMTY6MDM6MjQgMTM6MDg6MTEAAAWQAAAHAAAABDAyMjGQBAACAAAAFAAAAPagAQADAAAAAQABAACgAgAEAAAAAQAAANugAwAEAAAAAQAAANsAAAAAMjAxNjowMzoyNCAxMzowNToxMQD/4Q5aaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLwA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJYTVAgQ29yZSA1LjQuMCI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0RXZ0PSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VFdmVudCMiIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIgeG1sbnM6cGhvdG9zaG9wPSJodHRwOi8vbnMuYWRvYmUuY29tL3Bob3Rvc2hvcC8xLjAvIiBkYzpmb3JtYXQ9ImltYWdlL2pwZWciIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6OWUwZWI4Y2UtOTJjNy1hOTRiLTg4ZmUtZWUyZDhiZGY2ZGQwIiB4bXBNTTpEb2N1bWVudElEPSJhZG9iZTpkb2NpZDpwaG90b3Nob3A6NTBhMzk1MzQtZjE3ZS0xMWU1LTkyYjAtYzRmYTgwMDVmMzRmIiB4bXBNTTpPcmlnaW5hbERvY3VtZW50SUQ9IjQ4Q0I1Rjc1MDc5NkRGRDA5RjRGQUE2RUE2ODgzNjk2IiB4bXA6Q3JlYXRlRGF0ZT0iMjAxNi0wMy0yNFQxMzowNToxMSswODowMCIgeG1wOk1ldGFkYXRhRGF0ZT0iMjAxNi0wMy0yNFQxMzowODoxMSswODowMCIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgMjAxNSAoV2luZG93cykiIHhtcDpNb2RpZnlEYXRlPSIyMDE2LTAzLTI0VDEzOjA4OjExKzA4OjAwIiBwaG90b3Nob3A6SUNDUHJvZmlsZT0iYzIiIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiPiA8eG1wTU06SGlzdG9yeT4gPHJkZjpTZXE+IDxyZGY6bGkgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKFdpbmRvd3MpIiBzdEV2dDpjaGFuZ2VkPSIvIiBzdEV2dDp3aGVuPSIyMDE2LTAzLTI0VDEzOjA4OjExKzA4OjAwIiBzdEV2dDppbnN0YW5jZUlEPSJ4bXAuaWlkOjJhOTQ5MTkwLTNkOWYtZGQ0My1iODkwLWNjNjczNmYwNjM3OSIgc3RFdnQ6YWN0aW9uPSJzYXZlZCIvPiA8cmRmOmxpIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCBDQyAyMDE1IChXaW5kb3dzKSIgc3RFdnQ6Y2hhbmdlZD0iLyIgc3RFdnQ6d2hlbj0iMjAxNi0wMy0yNFQxMzowODoxMSswODowMCIgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDo5ZTBlYjhjZS05MmM3LWE5NGItODhmZS1lZTJkOGJkZjZkZDAiIHN0RXZ0OmFjdGlvbj0ic2F2ZWQiLz4gPC9yZGY6U2VxPiA8L3htcE1NOkhpc3Rvcnk+IDxwaG90b3Nob3A6VGV4dExheWVycz4gPHJkZjpCYWc+IDxyZGY6bGkgcGhvdG9zaG9wOkxheWVyTmFtZT0iTk8gUElDVFVSRSIgcGhvdG9zaG9wOkxheWVyVGV4dD0iTk8gUElDVFVSRSIvPiA8L3JkZjpCYWc+IDwvcGhvdG9zaG9wOlRleHRMYXllcnM+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDw/eHBhY2tldCBlbmQ9InciPz4A/+0AZFBob3Rvc2hvcCAzLjAAOEJJTQQEAAAAAAAsHAFaAAMbJUccAgAAAgACHAI+AAgyMDE2MDMyNBwCPwALMTMwNTExKzA4MDA4QklNBCUAAAAAABBO9LIOer18Qw4vc4iQGgw//8IAEQgA2wDbAwERAAIRAQMRAf/EAB8AAAEFAQEBAQEBAAAAAAAAAAMCBAEFAAYHCAkKC//EAMMQAAEDAwIEAwQGBAcGBAgGcwECAAMRBBIhBTETIhAGQVEyFGFxIweBIJFCFaFSM7EkYjAWwXLRQ5I0ggjhU0AlYxc18JNzolBEsoPxJlQ2ZJR0wmDShKMYcOInRTdls1V1pJXDhfLTRnaA40dWZrQJChkaKCkqODk6SElKV1hZWmdoaWp3eHl6hoeIiYqQlpeYmZqgpaanqKmqsLW2t7i5usDExcbHyMnK0NTV1tfY2drg5OXm5+jp6vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAQIAAwQFBgcICQoL/8QAwxEAAgIBAwMDAgMFAgUCBASHAQACEQMQEiEEIDFBEwUwIjJRFEAGMyNhQhVxUjSBUCSRoUOxFgdiNVPw0SVgwUThcvEXgmM2cCZFVJInotIICQoYGRooKSo3ODk6RkdISUpVVldYWVpkZWZnaGlqc3R1dnd4eXqAg4SFhoeIiYqQk5SVlpeYmZqgo6SlpqeoqaqwsrO0tba3uLm6wMLDxMXGx8jJytDT1NXW19jZ2uDi4+Tl5ufo6ery8/T19vf4+fr/2wBDAAEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQECAgICAgICAgICAgMDAwMDAwMDAwP/2wBDAQEBAQEBAQEBAQECAgECAgMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwP/2gAMAwEAAhEDEQAAAfqytWrVq1atWrVq1atWrVq1atWrVq1atWrVq1atWrVq1atWrVq1atWrVq1atWrVq1atWrVq1atWrVq1atWrVq1atWrVq1atWrVq1atWrVq1atWrVq1atWrVq1atWrVq1atWrVq1atWrVq1atWrVq1atWrVq1atWrVq1atWrVq1atWrVq1atWrVq1atWrVq1atWrVq1atWrVq1atWrVq1atWrVq1atWrVq1atWrVq1atWrVq9eprWrVq1atWrVq1aqquArVq1atWrVq1atWrV6pXldatWrVq1atWrVq9UryutWrVq1atWrVq1atXqleV1q1atWrVq1atWr1SvK61atWrVq1atWrVq1eqV5XWrVq1atWrVq1avVK8rrVq1atWrVq1atWrV6pXldatXslVNW9W1RXgtatWr1SvK61atWrVq1atWrVq1eqV5XWrV65Teurrmqsq8TrVq1eqV5XWrVq1atWrVq1atWr1SvK61areqiuip/TKubrVq1eqV5XWrVq1atWrVq1atWr1SmVcnTOu2oNWNcLSqtKXTmq+usryutWrVq1atWrVq1atXqldRTun9eBVWV6xSKLVjR6cV5FXY15XWrVq1atWrVq1atWr1SukryyvX65evN69KqypxVFT6rivKq6ivK61atWrVq1atWrVq1eqV5XWrVq1atWrVqipr1SvK61atWrVq1atWrVq1eqV5XWrVq1atWrVq1avVK8rrVq1atWrVq1atWrV6pXldatWrVq1atWrVq9UryutWrVq1atWrVq1atXqlatWrVq1atWrVq1c/XF1q1atWrVq1atWrVq1atWrVq1atWrVq1atWrVq1atWrVq1atWrVq1atWrVq1atWrVq1atWrVq1atWrVq1atWrVq1atWrVq1atWrVq1atWrVq1atWrVq1atWrVq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';"/>
                    </div>
                </div>
                <div>
                    <p class="margin-y-zero"><?php echo $image['name'] ?></p>
                    <input type="file" class="custom-file-input" name="item_image_temp"
                           id="<?php echo 'input_file_' . $image['item_id'] ?>" required>
                    <form class="store_image_form">
                        <div class="custom-file">
                            <input name="item_id" class="hidden" type="text" class="hidden"
                                   value="<?php echo $image['item_id'] ?>"/>
                            <input type="text" class="hidden"
                                   name="<?php echo $this->security->get_csrf_token_name(); ?>" value=""/>
                            <input type="submit" class="btn btn-info btn-sm" value="<?php echo $this->lang->line('consignmenters_upload_image');?>"/>
                        </div>
                    </form>
                </div>
            </div>

        <?php } ?>
    </div>
</div>

<script type="text/javascript">
    //validation and submit handling
    $(document).ready(function () {
        $.validator.addMethod('image', function (value, element) {
            let inputNameTemp = 'input_file_' + value;
            return $('#' + inputNameTemp).val() !== "";
        }, "<?php echo $this->lang->line('consignmenters_missing_images');?>");

        $('.store_image_form').each(function () {
            $(this).validate({
                ignore: [],
                rules: {
                    item_id: {
                        image: true
                    },
                },
                submitHandler: function (form) {
                    $('input[name="<?php echo $this->security->get_csrf_token_name(); ?>"]').val(csrf_token());
                    const data = new FormData(form);
                    const file = resizeImage("input_file_" + form[0].value);
                    file.then(function (result) {
                        data.append("item_image", result);
                        $.ajax({
                            type: "POST",
                            data: data,
                            url: "<?php echo base_url('items/store_image') ?>",
                            processData: false,
                            contentType: false,
                            cache: false,
                            success: function (rp) {
                                console.log("SUCCESS : ", rp);
                                location.reload();
                            },
                            error: function (xhr, resp, text) {
                                console.log(xhr, resp, text);
                                alert("<?php echo $this->lang->line('consignmenters_failed_upload_image');?>")
                            }
                        });
                    })
                },
            });
        });

        function resizeImage(id) {
            return new Promise(resolveReader => {
                var file = $("#" + id)[0].files[0];
                var reader = new FileReader();
                reader.onload = (e) => {
                    const imgFile = createTempImage(e, file.name);
                    imgFile.then(function (result) {
                        resolveReader(result);
                    })
                }
                reader.readAsDataURL(file);
            });
        }

        function createTempImage(e, fileName) {
            return new Promise(resolveImg => {
                var img = document.createElement("img");
                img.style.display = "none"
                img.onload = () => {
                    const canvasFile = createTempCanvas(img, fileName);
                    resolveImg(canvasFile);
                }
                img.src = e.target.result;
            })
        }

        function createTempCanvas(img, fileName) {
            var canvas = document.createElement('canvas');
            canvas.style.display = "none"
            var ctx = canvas.getContext("2d");
            ctx.drawImage(img, 0, 0);

            var MAX_WIDTH = 600;
            var MAX_HEIGHT = 600;
            var width = img.width;
            var height = img.height;

            if (width > height) {
                if (width > MAX_WIDTH) {
                    height *= MAX_WIDTH / width;
                    width = MAX_WIDTH;
                }
            } else {
                if (height > MAX_HEIGHT) {
                    width *= MAX_HEIGHT / height;
                    height = MAX_HEIGHT;
                }
            }
            canvas.width = width;
            canvas.height = height;
            var ctx = canvas.getContext("2d");
            ctx.drawImage(img, 0, 0, width, height);
            var dataurl = canvas.toDataURL("image/png");
            img.src = dataurl;

            var blobBin = atob(dataurl.split(',')[1]);
            var array = [];
            for (var i = 0; i < blobBin.length; i++) {
                array.push(blobBin.charCodeAt(i));
            }
            const blob = new Blob([new Uint8Array(array)], {type: 'image/png'});
            var resizedFile = new File([blob], fileName.substring(0, fileName.length - 4) + ".png", {
                type: "image/png",
                lastModified: new Date()
            })
            return resizedFile
        }

    });

</script>


<?php $this->load->view("partial/footer"); ?>
