<?php

namespace App\Http\Controllers\Admin;

use TCG\Voyager\Http\Controllers\VoyagerMediaController as BaseVoyagerMediaController;

class VoyagerMediaController extends BaseVoyagerMediaController
{
    /**
     * 文件上传
     * @return string
     */
    public function editorUpload()
    {

        $data = \EndaEditor::uploadImgFile('storage/posts/' . date('F') . date('Y'));

        return json_encode($data);
    }
}
