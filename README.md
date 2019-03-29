# -
    BFGS/阻尼Newton/FR共轭梯度/最速下降 求Shubert函数极小值  
    fun.m:函数
    gfun.m：函数梯度
    Hess.m:函数Hessian矩阵
    frcg.m:共轭梯度法求极小值
    zsxj.m:最速下降法求极小值
    bfgs3.m:拟牛顿法BFGS求极小值
    dampnm.m:阻尼Newton求极小值
    amj.m：使用阿弥加准则
    figure.m:画图函数
    运行方式：运行每种算法的m文件，可以更改不同初始点，收敛得到的极小值点不同，Shubert函数[-1,1]内共8个极小值点，1个全局极小点，[-0.8121,-0.8121]
    结论：函数经常会收敛到邻近的极小点,BFGS算法效果最好

