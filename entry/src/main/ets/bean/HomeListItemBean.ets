import { Bean } from './DeclareType'

export class HomeListItemBean {
  title: string = "" // 显示标题
  highlight?: boolean // 是否需要高亮显示
  className?: string = "" // 类名
  functionName?: string = "" // 静态方法名

  constructor(title: string) {
    this.title = title
  }

  append(a?: Bean): HomeListItemBean {
    this.highlight = a?.highlight
    this.className = a?.className
    this.functionName = a?.functionName
    return this
  }
}


 