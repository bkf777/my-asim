import React, { useState } from 'react';
import { Editor } from 'amis-editor';
import 'amis/lib/themes/cxd.css';

const App: React.FC = () => {
  const [schema, setSchema] = useState<any>({
    type: 'page',
    title: 'AMIS 可视化编辑器',
    body: {
      type: 'form',
      title: '表单',
      body: [
        {
          type: 'input-text',
          name: 'name',
          label: '姓名',
        },
        {
          type: 'input-email',
          name: 'email',
          label: '邮箱',
        },
      ],
    },
  });

  return (
    <div style={{ height: '100vh', display: 'flex', flexDirection: 'column' }}>
      <div style={{ padding: '16px', background: '#f5f5f5', borderBottom: '1px solid #e8e8e8' }}>
        <h2 style={{ margin: 0 }}>AMIS 可视化编辑器 - Qiankun 子应用</h2>
      </div>
      <div style={{ flex: 1, overflow: 'hidden' }}>
        <Editor
          value={schema}
          onChange={(value) => {
            console.log('Schema updated:', value);
            setSchema(value);
          }}
          preview={false}
          autoFocus={true}
          theme="cxd"
          className="editor-app"
        />
      </div>
    </div>
  );
};

export default App;
